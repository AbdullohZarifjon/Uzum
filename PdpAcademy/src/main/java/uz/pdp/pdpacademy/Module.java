package uz.pdp.pdpacademy;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
public class Module extends BaseClass{
    private String name;

    @ManyToOne
    private Course course;

    public Module(String name, Course course) {
        this.course = course;
        this.name = name;
    }

}
