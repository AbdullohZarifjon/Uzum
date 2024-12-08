package uz.pdp.pdpacademy;

import jakarta.persistence.Entity;
import jakarta.persistence.ManyToOne;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity
public class StudentRole extends BaseClass {
    @ManyToOne
    private Role role;
    @ManyToOne
    private Student student;

    public StudentRole(Role role, Student student) {
        this.role = role;
        this.student = student;
    }
}
