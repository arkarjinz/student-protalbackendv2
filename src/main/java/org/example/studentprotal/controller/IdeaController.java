package org.example.studentprotal.controller;

import lombok.RequiredArgsConstructor;
import org.example.studentprotal.dto.IdeaDto;
import org.example.studentprotal.service.IdeaService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.time.OffsetDateTime;
import java.util.List;

@RestController
@CrossOrigin(origins = "*")
@RequiredArgsConstructor
@RequestMapping("/api/student-portal/idea")
public class IdeaController {

    private final IdeaService ideaService;

    // Request records for creation and update
    record CreateIdeaRequest(String username, String title, String description, OffsetDateTime createdAt, List<Integer> sdgs) {}
    record UpdateIdeaRequest(String username, String title, String description, List<Integer> sdgs) {}

    @PostMapping("/create")
    public ResponseEntity<String> createIdea(@RequestBody CreateIdeaRequest request) {
        String response = ideaService.createIdea(
                request.username(),
                request.title(),
                request.description(),
                request.createdAt(),
                request.sdgs()
        );
        return ResponseEntity.ok(response);
    }

    @PutMapping("/{id}")
    public ResponseEntity<String> updateIdea(@PathVariable Integer id, @RequestBody UpdateIdeaRequest request) {
        String response = ideaService.updateIdea(id, request.username(), request.title(), request.description(), request.sdgs());
        return ResponseEntity.ok(response);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteIdea(@PathVariable Integer id, @RequestParam String username) {
        String response = ideaService.deleteIdea(id, username);
        return ResponseEntity.ok(response);
    }

    @PostMapping("/{id}/give-rose")
    public ResponseEntity<String> giveRoses(@PathVariable Integer id,
                                            @RequestParam String username,
                                            @RequestParam int roses) {
        String response = ideaService.giveRosesToIdea(id, username, roses);
        return ResponseEntity.ok(response);
    }

    @GetMapping("/all")
    public ResponseEntity<List<IdeaDto>> getAllIdeas() {
        List<IdeaDto> ideas = ideaService.getAllIdeas();
        return ResponseEntity.ok(ideas);
    }
}
