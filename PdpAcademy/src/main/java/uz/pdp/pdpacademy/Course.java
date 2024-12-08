package uz.pdp.pdpacademy;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@NoArgsConstructor
public class Course extends BaseClass{
    private String name;

    public Course(String name) {
        this.name = name;
    }

}
