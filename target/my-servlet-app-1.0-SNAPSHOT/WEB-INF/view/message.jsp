<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Message | Tagline Infotech</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #43cea2, #185a9d);
            color: white;
            font-family: 'Poppins', sans-serif;
            padding-top: 80px;
        }
        .message-box {
            background-color: rgba(0, 0, 0, 0.5);
            border-radius: 15px;
            padding: 40px;
            text-align: center;
            box-shadow: 0 8px 16px rgba(0,0,0,0.3);
        }
        .message-box h2 {
            font-weight: 600;
            margin-bottom: 20px;
        }
        .message-box p {
            font-size: 18px;
            margin-bottom: 30px;
        }
        .btn-back {
            background-color: #ffeb3b;
            color: #333;
            font-weight: bold;
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            text-decoration: none;
        }
        .btn-back:hover {
            background-color: #f2d600;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6 message-box">
            <h2>Notification</h2>
            <p>${message}</p>
            <a href="/EmployeeLeaveManagementSystem_war/" class="btn-back">Go Back to Home</a>
        </div>
    </div>
</div>

</body>
</html>
