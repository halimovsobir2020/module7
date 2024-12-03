package uz.pdp.demo12.test;

import jakarta.persistence.EntityManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static uz.pdp.demo12.MyListener.EMF;

@WebServlet("/region/update")
public class UpdateRegion extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (
                EntityManager entityManager = EMF.createEntityManager();
        ) {
            int regionId = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            int countryId = Integer.parseInt(req.getParameter("countryId"));
            entityManager.getTransaction().begin();
            Region region = entityManager.find(Region.class, regionId);
            Country country = entityManager.find(Country.class, countryId);
            region.setName(name);
            region.setCountry(country);
            entityManager.getTransaction().commit();
            resp.sendRedirect("/Region.jsp");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}
