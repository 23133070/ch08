<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Registration Successful</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
    <style>
        /* Inline CSS để đảm bảo style hoạt động */
        * { margin: 0; padding: 0; box-sizing: border-box; }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            margin: 0;
        }
        
        .container {
            background: white;
            border-radius: 15px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            padding: 40px;
            width: 100%;
            max-width: 500px;
            animation: slideIn 0.6s ease-out;
        }
        
        @keyframes slideIn {
            from { opacity: 0; transform: translateY(-30px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        h1 {
            color: #2c3e50;
            font-size: 2.2em;
            text-align: center;
            margin-bottom: 10px;
            font-weight: 700;
        }
        
        .success-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .success-message {
            color: #27ae60;
            font-size: 1.2em;
            font-weight: 600;
            margin-top: 10px;
        }
        
        .user-info {
            margin: 30px 0;
        }
        
        h3 {
            color: #2c3e50;
            margin-bottom: 15px;
            font-size: 1.3em;
        }
        
        .info-card {
            background: #f8f9fa;
            padding: 25px;
            border-radius: 10px;
            border: 1px solid #e9ecef;
        }
        
        .info-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 0;
            border-bottom: 1px solid #dee2e6;
        }
        
        .info-row:last-child {
            border-bottom: none;
        }
        
        .info-row label {
            color: #6c757d;
            font-weight: 600;
            margin: 0;
            flex: 1;
        }
        
        .info-row span {
            color: #2c3e50;
            font-weight: 500;
            flex: 2;
            text-align: right;
        }
        
        .stats, .support {
            background: #fff3cd;
            padding: 20px;
            border-radius: 10px;
            margin: 20px 0;
            border-left: 4px solid #ffc107;
        }
        
        .stats h3, .support h3 {
            color: #856404;
            margin-bottom: 10px;
        }
        
        .stats p, .support p {
            color: #856404;
            margin-bottom: 5px;
        }
        
        .support a {
            color: #007bff;
            text-decoration: none;
            font-weight: 600;
        }
        
        .support a:hover {
            text-decoration: underline;
        }
        
        .actions {
            text-align: center;
            margin: 30px 0 20px 0;
        }
        
        .return-btn {
            padding: 12px 25px;
            background: #3498db;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }
        
        .return-btn:hover {
            background: #2980b9;
            transform: translateY(-1px);
        }
        
        .footer {
            text-align: center;
            color: #6c757d;
            font-style: italic;
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px solid #dee2e6;
        }
    </style>    
</head>

<body>
    <div class="container">
        <div class="success-header">
            <h1>🎉 Welcome to Our Email List!</h1>
            <p class="success-message">Thank you for joining us!</p>
        </div>

        <div class="user-info">
            <h3>📝 Your Information:</h3>
            <div class="info-card">
                <div class="info-row">
                    <label>📧 Email:</label>
                    <span>${sessionScope.user.email}</span>
                </div>

                <div class="info-row">
                    <label>👤 First Name:</label>
                    <span>${sessionScope.user.firstName}</span>
                </div>

                <div class="info-row">
                    <label>👥 Last Name:</label>
                    <span>${sessionScope.user.lastName}</span>
                </div>
                
                <div class="info-row">
                    <label>📅 Registration Date:</label>
                    <span>${requestScope.currentDate}</span>
                </div>
            </div>
        </div>

        <!-- Hiển thị thống kê users nếu có -->
        <c:if test="${not empty sessionScope.users}">
            <div class="stats">
                <h3>📊 Community Stats:</h3>
                <p>Total registered users: ${sessionScope.users.size()}</p>
                
                <c:if test="${sessionScope.users.size() > 0}">
                    <p>Recent member: ${sessionScope.users[sessionScope.users.size()-1].firstName} ${sessionScope.users[sessionScope.users.size()-1].lastName}</p>
                </c:if>
            </div>
        </c:if>

        <!-- Hiển thị email hỗ trợ từ context-param -->
        <div class="support">
            <h3>💬 Need Help?</h3>
            <p>Contact us: <a href="mailto:${initParam.custServEmail}">${initParam.custServEmail}</a></p>
        </div>

        <div class="actions">
            <form action="emailList" method="get" style="display: inline;">
                <input type="hidden" name="action" value="join">
                <button type="submit" class="return-btn">← Add Another Email</button>
            </form>
        </div>
        
        <div class="footer">
            <p>🔔 You'll receive a confirmation email shortly!</p>
        </div>
    </div>
</body>
</html>
