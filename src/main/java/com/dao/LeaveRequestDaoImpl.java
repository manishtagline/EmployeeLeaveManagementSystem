package com.dao;

import com.entity.Employee;
import com.entity.Leave;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.ZoneId;
import java.time.temporal.*;

import java.util.List;

@Repository
public class LeaveRequestDaoImpl  implements LeaveRequestDao{

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public void submitLeaveRequest(Leave leave) {
        String insertQuery = "INSERT INTO leave_requests(startDate, endDate, reason, employee_id) VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(insertQuery,
                leave.getStartDate(),
                leave.getEndDate(),
                leave.getReason(),
                leave.getEmployee().getEmployeeId());
    }

    @Override
    public List<Leave> getAllLeaveRequest() {
        String sql = "SELECT lr.leaveId, lr.startDate, lr.endDate, lr.reason, lr.status, " +
                "e.employeeId , e.employeeName , e.email , e.designation , e.leaveBalance " +
                "FROM leave_requests lr " +
                "JOIN Employee e ON lr.employee_id = e.employeeId";


        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            // Map Leave object
            Leave leave = new Leave();
            leave.setLeaveId(rs.getInt("leaveId"));
            leave.setStartDate(rs.getTimestamp("startDate"));
            leave.setEndDate(rs.getTimestamp("endDate"));
            leave.setReason(rs.getString("reason"));
            leave.setStatus(rs.getString("status"));

            // Map Employee object
            Employee emp = new Employee();
            emp.setEmployeeId(rs.getInt("employeeId"));
            emp.setEmployeeName(rs.getString("employeeName"));
            emp.setEmail(rs.getString("email"));
            emp.setDesignation(rs.getString("designation"));
            emp.setLeaveBalance(rs.getInt("leavebalance"));

            // Set Employee in Leave
            leave.setEmployee(emp);

            return leave;
        });
    }

    @Override
    public void updateLeaveStatus(int leaveRequestId, String status) {
        Leave leave = jdbcTemplate.queryForObject("SELECT * FROM leave_requests WHERE leaveId = ?",
                    new BeanPropertyRowMapper<>(Leave.class),
                    leaveRequestId
                );

        if(status.equalsIgnoreCase("APPROVED")){
            LocalDate localStart = leave.getStartDate().toInstant()
                    .atZone(ZoneId.systemDefault())
                    .toLocalDate();

            LocalDate localEnd = leave.getEndDate().toInstant()
                    .atZone(ZoneId.systemDefault())
                    .toLocalDate();

            long days = localEnd.toEpochDay() - localStart.toEpochDay() + 1;

            jdbcTemplate.update("UPDATE Employee SET leaveBalance = leaveBalance - ? WHERE employeeId = ? ",
                        days,
                        leave.getEmployee().getEmployeeId()
                    );
        }
        jdbcTemplate.update(
                "UPDATE leave_requests SET status = ? WHERE id = ?",
                status,
                leaveRequestId
        );
    }

    @Override
    public Leave getLeaveById(int leaveId) {
        String query = "SELECT * FORM leave_requests WHERE leaveId = ?";
        return jdbcTemplate.queryForObject(query, new BeanPropertyRowMapper<>(Leave.class), leaveId);
    }
}
