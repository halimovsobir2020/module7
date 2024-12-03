package uz.pdp.demo12.todo;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Todo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false)
    private String title;

    private Boolean completed;

    @CreationTimestamp
    private LocalDate createdAt;

    public Todo(String title, Boolean completed) {
        this.title = title;
        this.completed = completed;
    }
}
