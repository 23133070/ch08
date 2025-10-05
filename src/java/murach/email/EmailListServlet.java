package murach.email;

import java.io.*;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.*;
import javax.servlet.http.*;

import murach.business.User;
import murach.data.UserDB;
import murach.data.UserIO;

public class EmailListServlet extends HttpServlet {    

    @Override
    protected void doPost(HttpServletRequest request, 
                          HttpServletResponse response) 
                          throws ServletException, IOException {

        HttpSession session = request.getSession();

        // Lấy action từ request
        String action = request.getParameter("action");
        if (action == null) {
            action = "join";  // mặc định
        }

        // Trang mặc định
        String url = "/index.jsp";

        if (action.equals("join")) {
            url = "/index.jsp";    
        }
        else if (action.equals("add")) {                
            // Lấy tham số từ form
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");

            // Kiểm tra dữ liệu đầu vào
            if (firstName != null && !firstName.trim().isEmpty() && 
                lastName != null && !lastName.trim().isEmpty() && 
                email != null && !email.trim().isEmpty()) {
                
                // Tạo user và lưu vào database
                User user = new User(firstName, lastName, email);
                UserDB.insert(user);

                // Lưu user vào session (scope: session)
                session.setAttribute("user", user);

                // Trang chuyển tiếp
                url = "/thanks.jsp";   
            } else {
                // Nếu dữ liệu không hợp lệ, quay lại form với thông báo lỗi
                request.setAttribute("errorMessage", "Please fill in all fields!");
                url = "/index.jsp";
            }
        }

        // Ngày hiện tại (scope: request)
        Date currentDate = new Date();
        request.setAttribute("currentDate", currentDate);

        // Lấy danh sách users từ file và lưu vào session (với xử lý lỗi)
        try {
            String path = request.getServletContext().getRealPath("/WEB-INF/EmailList.txt");
            ArrayList<User> users = UserIO.getUsers(path);
            if (users == null) {
                users = new ArrayList<User>();
            }
            session.setAttribute("users", users);
        } catch (Exception e) {
            // Tạo danh sách rỗng nếu có lỗi đọc file
            session.setAttribute("users", new ArrayList<User>());
        }

        // Forward request/response tới trang JSP
        request.getServletContext()
            .getRequestDispatcher(url)
            .forward(request, response);
    }    
    
    @Override
    protected void doGet(HttpServletRequest request, 
                          HttpServletResponse response) 
                          throws ServletException, IOException {
        doPost(request, response);
    }    
}
