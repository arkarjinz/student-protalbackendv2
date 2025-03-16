package org.example.studentprotal.dao;

import org.example.studentprotal.entity.Idea;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IdeaRepository extends JpaRepository<Idea, Integer> {
}
