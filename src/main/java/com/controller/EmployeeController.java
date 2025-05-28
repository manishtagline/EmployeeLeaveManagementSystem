package com.controller;

import com.dao.EmployeeDao;
import com.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class EmployeeController {


    @Autowired
    private EmployeeDao dao;

    @GetMapping("/addEmployee")
    public String addEmployee(Model model){
        model.addAttribute("employee",new Employee());
        return "addemployee";
    }

    @PostMapping("/saveEmployee")
    public String saveEmployee(@ModelAttribute("employee")Employee employee,Model model) {
        int result = dao.saveEmployee(employee);
        if (result > 0) {
            model.addAttribute("message", "Employee register successfully...");
            return "message";
        } else {
            model.addAttribute("errormessage", "Email already exists!!");
            return "addemployee";
        }
    }

    @GetMapping("/employeeList")
    public String employeeList(Model model){
        List<Employee> list =  dao.getAllEmployee();

        model.addAttribute("employees", list);
        return "employeelist";
    }

}
