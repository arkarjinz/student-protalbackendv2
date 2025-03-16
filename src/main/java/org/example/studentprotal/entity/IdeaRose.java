package org.example.studentprotal.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "idea_roses", uniqueConstraints = {
        @UniqueConstraint(columnNames = {"idea_id", "student_id"})
})
@Getter
@Setter
public class IdeaRose {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    // The idea that receives the roses
    @ManyToOne
    @JoinColumn(name = "idea_id", nullable = false)
    private Idea idea;

    // The student giving the roses
    @ManyToOne
    @JoinColumn(name = "student_id", nullable = false)
    private Student student;

    // Number of roses given in this transaction
    @Column(nullable = false)
    private int roseCount = 0;
}
