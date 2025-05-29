package com.controller;

import com.dao.EmployeeDao;
import com.dao.LeaveRequestDao;
import com.entity.Leave;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class LeaveController {

    @Autowired
    private EmployeeDao employeeDao;

    @Autowired
    private LeaveRequestDao leaveDao;

    @GetMapping("/leaveAssign")
    public String leaveAssign(Model model){
        model.addAttribute("leaveRequest", new Leave());
        return "leave";
    }

    @GetMapping("/addLeave")
   public String showLeaveForm(@RequestParam("empId")int id, Model model){
        Leave leave = new Leave();
        leave.setEmployee(employeeDao.getEmployeeById(id));

        model.addAttribute("leaveRequest", leave);
        return "leave";
   }

   @PostMapping("/submitLeave")
   public String submitLeave(@ModelAttribute("leaveRequest")Leave leave,Model model){
        leave.setStatus("Pending");
        leaveDao.submitLeaveRequest(leave);
        model.addAttribute("message", "You successfully apply the leave...");
        return "message";
   }


   @GetMapping("/manageLeaveRequest")
   public String manageLeave(Model model){
        List<Leave> leave = leaveDao.getAllLeaveRequest();
        model.addAttribute("leaveRequests", leave);
        return "manageleave";
   }

   @PostMapping("/leave/updateStatus")
   public String updateStatus(@RequestParam("leaveId") int leaveId,
                              @RequestParam("status") String status){

       leaveDao.updateLeaveStatus(leaveId,status);

       return "redirect:/manageLeaveRequest";
   }


}
