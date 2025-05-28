package com.dao;

import com.entity.Leave;

import java.util.List;

public interface LeaveRequestDao {

    void submitLeaveRequest(Leave leave);
    List<Leave> getAllLeaveRequest();
    Leave getLeaveById(int leaveId);
    void updateLeaveStatus(int leaveRequestId, String status);

}
