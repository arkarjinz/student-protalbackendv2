package org.example.studentprotal.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.OffsetDateTime;

@Entity
@Table(name = "exchange_history")
@Getter
@Setter
public class ExchangeHistory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    // Student who exchanged the item
    @ManyToOne
    private Student student;

    // Marketplace item exchanged
    @ManyToOne
    private MarketplaceItem marketplaceItem;

    // Quantity exchanged
    private int quantityExchanged;

    // Total roses spent for this exchange
    private int totalRosesSpent;

    // Date of exchange
    private OffsetDateTime exchangeDate;
}
