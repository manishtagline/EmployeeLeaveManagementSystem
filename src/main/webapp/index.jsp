<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Tagline Infotech | Admin Panel</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #667eea, #764ba2);
            background-attachment: fixed;
            background-size: cover;
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

        .extra-graphics {
            margin-top: 40px;
        }

        .extra-graphics img {
            width: 60px;
            margin: 10px;
            filter: brightness(1.2);
        }

        .thought {
            font-size: 15px;
            margin-top: 30px;
            color: #f1f1f1;
            font-style: italic;
        }

        .content {
            padding: 50px 40px;
        }

        .content h1 {
            font-size: 32px;
            font-weight: 600;
            margin-bottom: 30px;
        }

        .btn-dashboard {
            width: 100%;
            padding: 18px;
            margin-bottom: 20px;
            font-size: 16px;
            font-weight: 600;
            border-radius: 10px;
            transition: 0.3s ease;
        }

        .btn-dashboard:hover {
            transform: translateY(-3px);
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

            <div class="extra-graphics">
                <img src="https://img.icons8.com/color/96/teamwork--v2.png" alt="Teamwork">
                <img src="https://img.icons8.com/color/96/development-skill.png" alt="Skills">
                <img src="https://img.icons8.com/color/96/goal.png" alt="Goal">
                <img src="https://img.icons8.com/color/96/brainstorm-skill.png" alt="Brainstorm">
            </div>

            <div class="thought">
                “Great vision without great people is irrelevant.”<br>
                – Jim Collins
            </div>
        </div>

        <!-- Main Content -->
        <div class="col-md-9 content">
            <h1>Employee Leave Management Dashboard</h1>

            <div class="row">
                <div class="col-md-6">
                    <a href="addEmployee" class="btn btn-primary btn-dashboard">➕ Add New Employee</a>
                </div>
                <div class="col-md-6">
                    <a href="employeeList" class="btn btn-success btn-dashboard">📋 View All Employees</a>
                </div>
                <div class="col-md-6">
                    <a href="manageLeaveRequest" class="btn btn-info btn-dashboard">📝 Manage Leave Requests</a>
                </div>

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
