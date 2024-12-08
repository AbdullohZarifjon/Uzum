package uz.pdp.pdpacademy.Repo;

import jakarta.persistence.EntityManager;

import uz.pdp.pdpacademy.Module;
import uz.pdp.pdpacademy.MyListener;

import java.util.List;

public class ModuleRepo extends BaseRepo<Module> {

    public static List<Module> getModules() {
        try ( EntityManager entityManager = MyListener.EMF.createEntityManager()) {
            return entityManager.createQuery("from Module order by name", Module.class).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static List<Module> getModulesByCourseId(int courseId) {
        try ( EntityManager entityManager = MyListener.EMF.createEntityManager()) {
            try {
                return entityManager.createQuery("from Module m where m.course.id = :courseId order by name", Module.class)
                        .setParameter("courseId", courseId).getResultList();
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
    }

    public static Module getModule(int moduleId) {
        try ( EntityManager entityManager = MyListener.EMF.createEntityManager()) {
            return entityManager.find(Module.class, moduleId);
        }
    }
}
