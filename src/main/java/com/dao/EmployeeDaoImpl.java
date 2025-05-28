package com.dao;

import com.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class EmployeeDaoImpl implements EmployeeDao{

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public int saveEmployee(Employee employee) {
        String checkQuery = "SELECT COUNT(*) FROM Employee WHERE email = ?";
        Integer count = jdbcTemplate.queryForObject(checkQuery, new Object[]{employee.getEmail()}, Integer.class);

        int result = 0;
        if (count != null && count == 0) {
            String insertQuery = "INSERT INTO Employee(employeeName, email, designation, leaveBalance) VALUES (?, ?, ?, ?)";
            jdbcTemplate.update(insertQuery,
                    employee.getEmployeeName(),
                    employee.getEmail(),
                    employee.getDesignation(),
                    employee.getLeaveBalance());
            return result = 1;
        } else {
            return result = 0;
        }
    }

    @Override
    public List<Employee> getAllEmployee() {
        return jdbcTemplate.query("SELECT * FROM Employee", new BeanPropertyRowMapper<>(Employee.class));
    }

    @Override
    public Employee getEmployeeById(int id) {
        String query = "SELECT * FROM Employee WHERE employeeId = ?";
        return jdbcTemplate.queryForObject(query, new BeanPropertyRowMapper<>(Employee.class), id);
    }

    @Override
    public void updateLeaveBalance(int employeeId, int leaveBalance) {
        String query = "UPDATE Employee SET leaveBalance = ? WHERE employeeId = ?";
        jdbcTemplate.update(query,leaveBalance,employeeId);
    }
}
