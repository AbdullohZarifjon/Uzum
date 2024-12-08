package uz.pdp.pdpacademy;

import jakarta.persistence.Entity;
import lombok.Data;
import lombok.NoArgsConstructor;
import uz.pdp.pdpacademy.enumClass.SMAORoles;

@Entity
@Data
@NoArgsConstructor
public class Role extends BaseClass {
    private SMAORoles role;

    public Role(SMAORoles role) {
        this.role = role;
    }
}
