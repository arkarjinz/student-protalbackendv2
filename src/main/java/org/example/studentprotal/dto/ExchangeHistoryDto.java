package org.example.studentprotal.dto;

import lombok.Getter;
import lombok.Setter;

import java.time.OffsetDateTime;

@Getter
@Setter
public class ExchangeHistoryDto {
    private Integer id;
    private String itemName;
    private int quantityExchanged;
    private int totalRosesSpent;
    private OffsetDateTime exchangeDate;

    public ExchangeHistoryDto(Integer id, String itemName, int quantityExchanged, int totalRosesSpent, OffsetDateTime exchangeDate) {
        this.id = id;
        this.itemName = itemName;
        this.quantityExchanged = quantityExchanged;
        this.totalRosesSpent = totalRosesSpent;
        this.exchangeDate = exchangeDate;
    }
}
