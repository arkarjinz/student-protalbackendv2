package org.example.studentprotal.dto;

import lombok.Getter;
import lombok.Setter;
import java.time.OffsetDateTime;
import java.util.List;

@Getter
@Setter
public class IdeaDto {
    private Integer id;
    private String title;
    private String description;
    private OffsetDateTime createdAt;
    private String ideaOwner;
    private String profileImage;
    private int roseCount;
    private List<Integer> sdgs;

    public IdeaDto() {}

    public IdeaDto(Integer id, String title, String description, OffsetDateTime createdAt,
                   String ideaOwner, String profileImage, int roseCount, List<Integer> sdgs) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.createdAt = createdAt;
        this.ideaOwner = ideaOwner;
        this.profileImage = profileImage;
        this.roseCount = roseCount;
        this.sdgs = sdgs;
    }
}
