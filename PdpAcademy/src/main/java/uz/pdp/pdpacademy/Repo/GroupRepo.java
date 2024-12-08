package uz.pdp.pdpacademy.Repo;

import jakarta.persistence.EntityManager;
import uz.pdp.pdpacademy.Groups;
import uz.pdp.pdpacademy.MyListener;

import java.util.List;

public class GroupRepo extends BaseRepo<Groups> {

    public static List<Groups> getAllGroups() {
        try (EntityManager entityManager = MyListener.EMF.createEntityManager()) {
            return entityManager.createQuery("from Groups order by name", Groups.class).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static List<Groups> getGroupByModuleId(int moduleId) {
        try (EntityManager entityManager = MyListener.EMF.createEntityManager()) {
            return entityManager.createQuery("from Groups g where g.module.id = :moduleId order by name", Groups.class)
                    .setParameter("moduleId", moduleId).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static Groups getGroupById(int id) {
        try (EntityManager entityManager = MyListener.EMF.createEntityManager()) {
            return entityManager.find(Groups.class, id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
