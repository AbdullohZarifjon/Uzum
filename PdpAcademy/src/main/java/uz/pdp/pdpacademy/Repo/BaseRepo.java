package uz.pdp.pdpacademy.Repo;

import jakarta.persistence.EntityManager;
import uz.pdp.pdpacademy.MyListener;

import java.lang.reflect.ParameterizedType;
import java.util.List;

public class BaseRepo<T> {
    private final Class<T> persistenceClass;

    public BaseRepo() {
        Class<T> clazz = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
        this.persistenceClass = clazz;
    }


    public void save(T entity) {
        try (EntityManager entityManager = MyListener.EMF.createEntityManager()) {
            entityManager.getTransaction().begin();
            entityManager.persist(entity);

            entityManager.getTransaction().commit();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public List<T> findAll() {
        try (EntityManager entityManager = MyListener.EMF.createEntityManager()) {
            return entityManager.createQuery("from %s order by name".formatted(persistenceClass.getSimpleName()), persistenceClass).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
