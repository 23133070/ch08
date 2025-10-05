<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Murach's Java Servlets and JSP</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>    
</head>

<body>
    <h1>Thanks for joining our email list</h1>

    <p>Here is the information that you entered:</p>

    <label>Email:</label>
    <span>${sessionScope.user.email}</span><br>

    <label>First Name:</label>
    <span>${sessionScope.user.firstName}</span><br>

    <label>Last Name:</label>
    <span>${sessionScope.user.lastName}</span><br>

    <!-- Hiển thị ngày hiện tại -->
    <p>Today is: ${requestScope.currentDate}</p>

    <!-- Hiển thị 2 user đầu tiên trong danh sách -->
    <p>First User: ${sessionScope.users[0].firstName} ${sessionScope.users[0].lastName}, ${sessionScope.users[0].email}</p>
    <p>Second User: ${sessionScope.users[1].firstName} ${sessionScope.users[1].lastName}, ${sessionScope.users[1].email}</p>

    <!-- Hiển thị email hỗ trợ từ context-param -->
    <p>Customer Service Email: ${initParam.custServEmail}</p>

    <p>To enter another email address, click on the Back 
    button in your browser or the Return button shown 
    below.</p>

    <form action="" method="get">
        <input type="hidden" name="action" value="join">
        <input type="submit" value="Return">
    </form>
</body>
</html>
