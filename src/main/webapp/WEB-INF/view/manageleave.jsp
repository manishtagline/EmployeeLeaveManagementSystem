<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Leave Requests - Tagline Infotech</title>
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
            background-color: rgba(255, 255, 255, 0.9);
            color: #333;
            border-radius: 15px;
            min-height: 100vh;
        }

        .content h2 {
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 30px;
            text-align: center;
        }

        .footer {
            margin-top: 60px;
            font-size: 14px;
            text-align: center;
            color: #999;
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
            <h2>Manage Leave Requests</h2>

            <table class="table table-striped table-hover table-bordered align-middle">
                <thead class="table-dark">
                <tr>
                    <th>Employee</th>
                    <th>Start</th>
                    <th>End</th>
                    <th>Reason</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="request" items="${leaveRequests}">
                    <tr>
                        <td>${request.employee.employeeName}</td>
                        <td>${request.startDate}</td>
                        <td>${request.endDate}</td>
                        <td>${request.reason}</td>
                        <td>
                            <span class="badge
                                <c:choose>
                                    <c:when test="${request.status == 'APPROVED'}">bg-success</c:when>
                                    <c:when test="${request.status == 'REJECTED'}">bg-danger</c:when>
                                    <c:otherwise>bg-warning text-dark</c:otherwise>
                                </c:choose>">
                                    ${request.status}
                            </span>
                        </td>
                        <td>
                            <c:if test="${request.status == 'Pending'}">
                                <form action="leave/updateStatus" method="post" class="d-inline">
                                    <input type="hidden" name="leaveId" value="${request.leaveId}" />
                                    <input type="hidden" name="status" value="APPROVED" />
                                    <button type="submit" class="btn btn-sm btn-success">Approve</button>
                                </form>
                                <form action="leave/updateStatus" method="post" class="d-inline">
                                    <input type="hidden" name="leaveId" value="${request.leaveId}" />
                                    <input type="hidden" name="status" value="REJECTED" />
                                    <button type="submit" class="btn btn-sm btn-danger">Reject</button>
                                </form>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <div class="mb-4 d-flex justify-content-center">
                <a href="index.jsp" class="btn btn-warning px-4 py-2 fw-semibold rounded-pill shadow-sm">
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
