package uz.pdp.pdpacademy.Repo;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import uz.pdp.pdpacademy.MyListener;
import uz.pdp.pdpacademy.Student;

import java.util.List;

public class StudentRepo extends BaseRepo<Student> {

    public static List<Student> getStudents(int boshlangich) {
        if (boshlangich != 0) {
            boshlangich --;
            boshlangich *= 10;
        }
        try (EntityManager entityManager = MyListener.EMF.createEntityManager()) {
            return entityManager.createNativeQuery("select * from Student s order by name limit 10 offset :boshlangich", Student.class)
                    .setParameter("boshlangich", boshlangich)
                    .getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static List<Student> getStudentsByGroupId(int groupId) {
        try (EntityManager entityManager = MyListener.EMF.createEntityManager()) {
            return entityManager.createQuery("from Student s where s.group.id = :groupId order by name", Student.class)
                    .setParameter("groupId", groupId)
                    .getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static int countStudents() {
        try (EntityManager entityManager = MyListener.EMF.createEntityManager()) {
            return entityManager.createQuery("select count(s) from Student s", Long.class).getSingleResult().intValue();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static Student getStudentByIdByGroupId(String name, int groupId) {
        try (EntityManager entityManager = MyListener.EMF.createEntityManager()) {
            return entityManager.createQuery("from Student s where s.group.id = :groupId and s.name = :name", Student.class)
                    .setParameter("groupId", groupId)
                    .setParameter("name", name)
                    .getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
