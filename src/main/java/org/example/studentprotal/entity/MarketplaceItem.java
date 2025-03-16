package org.example.studentprotal.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "marketplace_items")
@Getter
@Setter
public class MarketplaceItem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    // Item name
    @Column(nullable = false)
    private String name;

    // Item description
    @Column(nullable = false, columnDefinition = "TEXT")
    private String description;

    // Quantity available
    @Column(nullable = false)
    private int quantity;

    // Price in roses
    @Column(nullable = false)
    private int price;

    // Image stored as binary data
    @Lob
    private byte[] image;

    // Category (e.g., "Energy", "Eco-Friendly", "Stationery", etc.)
    private String category;
}
