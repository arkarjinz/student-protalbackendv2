package org.example.studentprotal.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.time.OffsetDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "ideas")
@Getter
@Setter
public class Idea {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false)
    private String title;

    @Column(nullable = false, columnDefinition = "TEXT")
    private String description;

    private OffsetDateTime createdAt;

    private int roseCount = 0;

    @ManyToOne
    private Student student;

    // New: SDG tagging
    @ElementCollection
    private List<Integer> sdgs = new ArrayList<>();
}
