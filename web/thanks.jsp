<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Registration Successful</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>    
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
