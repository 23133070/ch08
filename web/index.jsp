<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Email List Registration</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
</head>
<body>
    <div class="container">
        <h1>📧 Join Our Email List</h1>
        <p class="subtitle">Stay updated with our latest news and offers!</p>
        
        <!-- Hiển thị thông báo lỗi nếu có -->
        <c:if test="${not empty requestScope.errorMessage}">
            <div class="error-message">
                ⚠️ ${requestScope.errorMessage}
            </div>
        </c:if>

        <form action="emailList" method="post" class="email-form">
            <input type="hidden" name="action" value="add">        

            <div class="form-group">
                <label for="email">Email Address:</label>
                <input type="email" id="email" name="email" 
                       value="${sessionScope.user.email}" 
                       placeholder="your.email@example.com" 
                       required>
            </div>

            <div class="form-group">
                <label for="firstName">First Name:</label>
                <input type="text" id="firstName" name="firstName" 
                       value="${sessionScope.user.firstName}" 
                       placeholder="Enter your first name" 
                       required>
            </div>

            <div class="form-group">
                <label for="lastName">Last Name:</label>
                <input type="text" id="lastName" name="lastName" 
                       value="${sessionScope.user.lastName}" 
                       placeholder="Enter your last name" 
                       required>
            </div>

            <div class="form-group">
                <button type="submit" class="submit-btn">🚀 Join Now</button>
            </div>
        </form>
        
        <div class="info">
            <p>✅ No spam, unsubscribe anytime</p>
            <p>🔒 Your privacy is protected</p>
        </div>
    </div>
</body>
</html>
