package uz.pdp.pdpacademy;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@MappedSuperclass
public abstract class BaseClass {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
}
