package uz.pdp.demo12.todo;

import jakarta.persistence.EntityManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static uz.pdp.demo12.MyListener.EMF;

@WebServlet("/todo")
public class AddTodoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (
                EntityManager entityManager = EMF.createEntityManager();
        ) {
            String title = req.getParameter("title");
            Todo todo = new Todo(title, false);
            TodoRepo todoRepo = new TodoRepo();
            todoRepo.save(todo);
            resp.sendRedirect("/Todo.jsp");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
