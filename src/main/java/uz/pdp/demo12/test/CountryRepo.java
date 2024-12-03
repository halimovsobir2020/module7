package uz.pdp.demo12.test;

import jakarta.persistence.EntityManager;

import java.util.ArrayList;
import java.util.List;

import static uz.pdp.demo12.MyListener.EMF;

public class CountryRepo {

    public static List<Country> getAllCountries() {
        try (
                EntityManager entityManager = EMF.createEntityManager();
        ) {
            return entityManager.createQuery("from Country ", Country.class).getResultList();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @SuppressWarnings("all")
    public static List<ReportData> getReport() {
        try (
                EntityManager entityManager = EMF.createEntityManager();
        ) {

            return entityManager.createNativeQuery("""
                         select c.name, count(r.id)
                    from country c
                             join region r on c.id = r.country_id
                    group by c.id
                    """, ReportData.class).getResultList();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}
