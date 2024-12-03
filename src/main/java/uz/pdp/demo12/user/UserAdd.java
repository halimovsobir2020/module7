package uz.pdp.demo12.user;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/user/add")
public class UserAdd extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String country = req.getParameter("country");
        String region = req.getParameter("region");
        UserRepo userRepo = new UserRepo();
        userRepo.save(new User(
                firstName,lastName,new Address(country,region)
        ));
        resp.sendRedirect("/User.jsp");
    }
}
