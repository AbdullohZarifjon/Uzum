package uz.pdp.pdpacademy.Repo;

import jakarta.persistence.EntityManager;
import uz.pdp.pdpacademy.Role;
import uz.pdp.pdpacademy.enumClass.SMAORoles;

import static uz.pdp.pdpacademy.MyListener.EMF;

public class RoleRepo extends BaseRepo<Role> {

    public Role getRole(SMAORoles role) {
        try (EntityManager entityManager = EMF.createEntityManager()) {
            return entityManager.find(Role.class, role);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
