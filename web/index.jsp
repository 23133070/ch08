<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Email List Registration</title>
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
        
        .subtitle {
            text-align: center;
            color: #7f8c8d;
            margin-bottom: 30px;
            font-size: 1.1em;
        }
        
        .form-group {
            margin-bottom: 25px;
        }
        
        label {
            display: block;
            color: #2c3e50;
            font-weight: 600;
            margin-bottom: 8px;
            font-size: 1em;
        }
        
        input[type="text"], input[type="email"] {
            width: 100%;
            padding: 15px;
            border: 2px solid #e1e8ed;
            border-radius: 10px;
            font-size: 16px;
            transition: all 0.3s ease;
            background: #f8f9fa;
        }
        
        input[type="text"]:focus, input[type="email"]:focus {
            outline: none;
            border-color: #667eea;
            background: white;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }
        
        .submit-btn, button[type="submit"] {
            width: 100%;
            padding: 15px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 1.1em;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        
        .submit-btn:hover, button[type="submit"]:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.3);
        }
        
        .error-message {
            background: #ffe6e6;
            color: #d63031;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            border-left: 4px solid #d63031;
            font-weight: 500;
        }
        
        .info {
            background: #e8f5e8;
            padding: 20px;
            border-radius: 10px;
            margin-top: 20px;
            border-left: 4px solid #27ae60;
        }
        
        .info p {
            color: #27ae60;
            margin-bottom: 5px;
            font-weight: 500;
        }
    </style>
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
