package org.example.studentprotal.dao;

import org.example.studentprotal.entity.ExchangeHistory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ExchangeHistoryRepository extends JpaRepository<ExchangeHistory, Integer> {
    List<ExchangeHistory> findByStudentId(Integer studentId);
    // In ExchangeHistoryRepository.java
    @Query("SELECT eh FROM ExchangeHistory eh WHERE eh.marketplaceItem.id = :itemId")
    List<ExchangeHistory> findByMarketplaceItemId(@Param("itemId") Integer itemId);
}
