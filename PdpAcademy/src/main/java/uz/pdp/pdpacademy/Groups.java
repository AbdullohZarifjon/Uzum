package uz.pdp.pdpacademy;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@NoArgsConstructor
public class Groups extends BaseClass{
    private String name;

    @ManyToOne
    private Module module;

    public Groups(String name, Module module) {
        this.name = name;
        this.module = module;
    }
}
