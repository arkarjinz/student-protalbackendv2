package org.example.studentprotal.dao;

import org.example.studentprotal.entity.IdeaRose;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface IdeaRoseRepository extends JpaRepository<IdeaRose, Integer> {
    Optional<IdeaRose> findByIdeaIdAndStudentId(Integer ideaId, Integer studentId);
}
