package org.example.studentprotal.dao;

import org.example.studentprotal.entity.MarketplaceItem;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MarketplaceItemRepository extends JpaRepository<MarketplaceItem, Integer> {
}
