package uz.pdp.pdpacademy;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@Entity
public class Student extends BaseClass {
    @NotBlank(message = "ismingizni kiriting!")
    private String name;
    private double payment;

    @ManyToOne
    @NotNull(message = "guruhingizni tanlang!")
    private Groups group;

    public Student(String name, double payment, Groups group) {
        this.name = name;
        this.payment = payment;
        this.group = group;
    }

}
