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

            // Tạo user và lưu vào database
            User user = new User(firstName, lastName, email);
            UserDB.insert(user);

            // Lưu user vào session (scope: session)
            session.setAttribute("user", user);

            // Trang chuyển tiếp
            url = "/thanks.jsp";   
        }

        // Ngày hiện tại (scope: request)
        Date currentDate = new Date();
        request.setAttribute("currentDate", currentDate);

        // Lấy danh sách users từ file và lưu vào session
        String path = getServletContext().getRealPath("/WEB-INF/EmailList.txt");
        ArrayList<User> users = UserIO.getUsers(path);
        session.setAttribute("users", users);

        // Forward request/response tới trang JSP
        getServletContext()
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
