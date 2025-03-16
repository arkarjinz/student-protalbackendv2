package org.example.studentprotal.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MarketplaceItemDto {
    private Integer id;
    private String name;
    private String description;
    private int quantity;
    private int price;
    private String imageBase64;
    private String category;

    public MarketplaceItemDto(Integer id, String name, String description, int quantity, int price,
                              String imageBase64, String category) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.quantity = quantity;
        this.price = price;
        this.imageBase64 = imageBase64;
        this.category = category;
    }
}
