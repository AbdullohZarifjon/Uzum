package uz.pdp.pdpacademy;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import uz.pdp.pdpacademy.Repo.RoleRepo;
import uz.pdp.pdpacademy.enumClass.SMAORoles;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.util.List;

@WebListener
public class MyListener implements ServletContextListener {
    private final RoleRepo roleRepo = new RoleRepo();
    public static EntityManagerFactory EMF;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        EMF = Persistence.createEntityManagerFactory("default");
        try (EntityManager entityManager = EMF.createEntityManager()) {
            List<Role> roles = entityManager.createQuery("select r from Role r", Role.class).getResultList();

            if (roles.isEmpty()) {
                Role role = new Role(SMAORoles.STUDENT);
                Role role1 = new Role(SMAORoles.ADMIN);
                Role role2 = new Role(SMAORoles.STUDENT);
                roleRepo.save(role);
                roleRepo.save(role1);
                roleRepo.save(role2);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}
