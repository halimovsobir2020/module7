package uz.pdp.demo12.todo;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import uz.pdp.demo12.BaseRepo;

import java.util.List;

import static uz.pdp.demo12.MyListener.EMF;

public class TodoRepo extends BaseRepo<Todo> {

    public static List<Todo> getTodoList(int pagejon, String search) {
        pagejon--;
        try (
                EntityManager em = EMF.createEntityManager();
        ) {
            Query selectTFromTodoT = em.createNativeQuery("select * from todo t where t.title ilike '%'|| :search || '%' limit 10 offset :off", Todo.class)
                    .setParameter("off", pagejon*10)
                    .setParameter("search", search);

            return selectTFromTodoT.getResultList();
        }
    }

    public static Long count(String search) {
        try (
                EntityManager em = EMF.createEntityManager();
        ) {
            Query selectTFromTodoT = em.createNativeQuery("select count(*) from todo where title ilike '%'|| :search ||'%' ", Long.class)
                    .setParameter("search",search);
            return  (Long) selectTFromTodoT.getSingleResult();
        }
    }
}
