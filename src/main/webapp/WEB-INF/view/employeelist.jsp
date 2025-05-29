<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Tagline Infotech | Employee List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #43cea2, #185a9d);
            color: #fff;
        }
        .sidebar {
            background: rgba(0, 0, 0, 0.3);
            min-height: 100vh;
            padding: 30px 20px;
            backdrop-filter: blur(8px);
            text-align: center;
        }
        .sidebar img {
            width: 100px;
            margin-bottom: 15px;
            filter: drop-shadow(0 0 6px rgba(255, 255, 255, 0.5));
        }
        .company-name {
            font-size: 22px;
            font-weight: 700;
            color: #ffeb3b;
            margin-bottom: 10px;
        }
        .tagline {
            font-size: 14px;
            color: #eee;
            font-style: italic;
            margin-bottom: 30px;
        }
        .content {
            padding: 50px 40px;
        }
        h1 {
            font-size: 32px;
            font-weight: 600;
            margin-bottom: 30px;
        }
        .table-container {
            background-color: rgba(255, 255, 255, 0.1);
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 0 20px rgba(255, 255, 255, 0.1);
        }
        .table thead {
            background-color: #ffc107;
            color: #212529;
        }
        .table tbody tr {
            background-color: rgba(255, 255, 255, 0.05);
            transition: all 0.3s ease-in-out;
        }
        .table tbody tr:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }
        .badge {
            font-size: 0.9em;
            padding: 0.5em 0.75em;
        }
        .footer {
            margin-top: 60px;
            font-size: 14px;
            text-align: center;
            color: #ccc;
        }
    </style>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-3 sidebar d-flex flex-column align-items-center justify-content-start">
            <img src="https://img.icons8.com/clouds/200/company.png" alt="Company Logo">
            <div class="company-name">Tagline Infotech</div>
            <div class="tagline">Innovating Tomorrow's Workforce</div>
        </div>

        <!-- Main Content -->
        <div class="col-md-9 content">
            <h1>Employee List</h1>

            <div class="table-container">
                <table class="table table-hover table-striped table-bordered text-white align-middle">
                    <thead class="text-dark text-center">
                    <tr>
                        <th>ID</th>
                        <th>Employee Name</th>
                        <th>Email</th>
                        <th>Designation</th>
                        <th>Leave Balance</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody class="text-center">
                    <c:forEach var="emp" items="${employees}">
                        <tr>
                            <td>${emp.employeeId}</td>
                            <td>${emp.employeeName}</td>
                            <td>${emp.email}</td>
                            <td>${emp.designation}</td>
                            <td>
                                    <span class="badge
                                        ${emp.leaveBalance >= 15 ? 'bg-success' :
                                          emp.leaveBalance >= 5 ? 'bg-warning text-dark' : 'bg-danger'}">
                                            ${emp.leaveBalance}
                                    </span>
                            </td>
                            <td>
                                <a href="addLeave?empId=${emp.employeeId}" class="btn btn-sm btn-success">Apply for Leave</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>


            <div class="mb-4 d-flex justify-content-center">
                <a href="/EmployeeLeaveManagementSystem_war/" class="btn btn-warning px-4 py-2 fw-semibold rounded-pill shadow-sm">
                    ← Back to Home
                </a>
            </div>

            <div class="footer">
                &copy; 2025 Tagline Infotech. All Rights Reserved.
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
