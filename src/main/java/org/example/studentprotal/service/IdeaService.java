package org.example.studentprotal.service;

import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.example.studentprotal.dao.IdeaRepository;
import org.example.studentprotal.dao.StudentDao;
import org.example.studentprotal.dto.IdeaDto;
import org.example.studentprotal.entity.Idea;
import org.example.studentprotal.entity.Student;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.time.OffsetDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class IdeaService {

    private final StudentDao studentDao;
    private final IdeaRepository ideaRepository;

    @Transactional
    public String createIdea(String username, String title, String description, OffsetDateTime createdAt, List<Integer> sdgs) {
        Student student = studentDao.findByUsername(username)
                .orElseThrow(() -> new EntityNotFoundException("Student not found"));
        Idea idea = new Idea();
        idea.setTitle(title);
        idea.setDescription(description);
        idea.setCreatedAt(createdAt);
        idea.setStudent(student);
        idea.setSdgs(sdgs);
        ideaRepository.save(idea);
        return "Idea created successfully.";
    }

    @Transactional
    public String updateIdea(Integer ideaId, String username, String newTitle, String newDescription, List<Integer> sdgs) {
        Idea idea = ideaRepository.findById(ideaId)
                .orElseThrow(() -> new EntityNotFoundException("Idea not found"));
        if (!idea.getStudent().getUsername().equalsIgnoreCase(username)) {
            throw new RuntimeException("Unauthorized update attempt");
        }
        idea.setTitle(newTitle);
        idea.setDescription(newDescription);
        idea.setSdgs(sdgs);
        ideaRepository.save(idea);
        return "Idea updated successfully.";
    }

    @Transactional
    public String deleteIdea(Integer ideaId, String username) {
        Idea idea = ideaRepository.findById(ideaId)
                .orElseThrow(() -> new EntityNotFoundException("Idea not found"));
        if (!idea.getStudent().getUsername().equalsIgnoreCase(username)) {
            throw new RuntimeException("Unauthorized delete attempt");
        }
        ideaRepository.delete(idea);
        return "Idea deleted successfully.";
    }

    @Transactional
    public String giveRosesToIdea(Integer ideaId, String username, int roses) {
        Student giver = studentDao.findByUsername(username)
                .orElseThrow(() -> new EntityNotFoundException("Sender student not found"));
        if (giver.getRoseCount() < roses) {
            return "Insufficient rose balance";
        }
        Idea idea = ideaRepository.findById(ideaId)
                .orElseThrow(() -> new EntityNotFoundException("Idea not found"));
        // Deduct from sender
        giver.setRoseCount(giver.getRoseCount() - roses);
        studentDao.save(giver);
        // Increase idea support count
        idea.setRoseCount(idea.getRoseCount() + roses);
        ideaRepository.save(idea);
        // Increase receiver's rose balance (idea creator)
        Student receiver = idea.getStudent();
        receiver.setRoseCount(receiver.getRoseCount() + roses);
        studentDao.save(receiver);
        return "Successfully given " + roses + " roses to the idea.";
    }

    @Transactional(readOnly = true)
    public List<IdeaDto> getAllIdeas() {
        List<Idea> ideas = ideaRepository.findAll();
        return ideas.stream().map(idea -> new IdeaDto(
                idea.getId(),
                idea.getTitle(),
                idea.getDescription(),
                idea.getCreatedAt(),
                idea.getStudent().getUsername(),
                idea.getStudent().getProfileImage(),
                idea.getRoseCount(),
                idea.getSdgs()
        )).collect(Collectors.toList());
    }
}
