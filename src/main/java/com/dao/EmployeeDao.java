package com.dao;

import com.entity.Employee;

import java.util.List;

public interface EmployeeDao {

    int saveEmployee(Employee employee);
    List<Employee> getAllEmployee();
    Employee getEmployeeById(int id);
    void updateLeaveBalance(int employeeId, int leaveBalance);

}
