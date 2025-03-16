package org.example.studentprotal.service;

import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.example.studentprotal.dao.ExchangeHistoryRepository;
import org.example.studentprotal.dao.MarketplaceItemRepository;
import org.example.studentprotal.dao.StudentDao;
import org.example.studentprotal.dto.MarketplaceItemDto;
import org.example.studentprotal.dto.ExchangeHistoryDto;
import org.example.studentprotal.entity.ExchangeHistory;
import org.example.studentprotal.entity.MarketplaceItem;
import org.example.studentprotal.entity.Student;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.OffsetDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class MarketplaceService {

    private final MarketplaceItemRepository itemRepository;
    private final StudentDao studentDao;
    private final ExchangeHistoryRepository historyRepository;

    // Admin functions: create, update, delete marketplace items.
    @Transactional
    public String createMarketplaceItem(String name, String description, int quantity, int price, byte[] image, String category) {
        MarketplaceItem item = new MarketplaceItem();
        item.setName(name);
        item.setDescription(description);
        item.setQuantity(quantity);
        item.setPrice(price);
        item.setImage(image);
        item.setCategory(category);
        itemRepository.save(item);
        return "Marketplace item created successfully.";
    }

    @Transactional
    public String updateMarketplaceItem(Integer itemId, String name, String description, int quantity, int price, byte[] image, String category) {
        MarketplaceItem item = itemRepository.findById(itemId)
                .orElseThrow(() -> new EntityNotFoundException("Item not found"));
        item.setName(name);
        item.setDescription(description);
        item.setQuantity(quantity);
        item.setPrice(price);
        if (image != null && image.length > 0) {
            item.setImage(image);
        }
        item.setCategory(category);
        itemRepository.save(item);
        return "Marketplace item updated successfully.";
    }

    @Transactional
    public String deleteMarketplaceItem(Integer itemId) {
        // First delete all associated exchange history
        List<ExchangeHistory> histories = historyRepository.findByMarketplaceItemId(itemId);
        historyRepository.deleteAll(histories);

        // Then delete the item
        MarketplaceItem item = itemRepository.findById(itemId)
                .orElseThrow(() -> new EntityNotFoundException("Item not found"));
        itemRepository.delete(item);
        return "Marketplace item deleted successfully.";
    }

    // User functions:
    public List<MarketplaceItemDto> getAllMarketplaceItems() {
        List<MarketplaceItem> items = itemRepository.findAll();
        return items.stream().map(item -> new MarketplaceItemDto(
                item.getId(),
                item.getName(),
                item.getDescription(),
                item.getQuantity(),
                item.getPrice(),
                item.getImage() != null ? java.util.Base64.getEncoder().encodeToString(item.getImage()) : null,
                item.getCategory()
        )).collect(Collectors.toList());
    }

    @Transactional
    public String exchangeItem(Integer itemId, String username, int quantityRequested) {
        Student student = studentDao.findByUsername(username)
                .orElseThrow(() -> new EntityNotFoundException("Student not found"));
        MarketplaceItem item = itemRepository.findById(itemId)
                .orElseThrow(() -> new EntityNotFoundException("Item not found"));
        if (item.getQuantity() < quantityRequested) {
            return "Not enough quantity available.";
        }
        int totalCost = item.getPrice() * quantityRequested;
        if (student.getRoseCount() < totalCost) {
            return "Insufficient rose balance.";
        }
        // Deduct roses from student
        student.setRoseCount(student.getRoseCount() - totalCost);
        studentDao.save(student);
        // Decrease item quantity
        item.setQuantity(item.getQuantity() - quantityRequested);
        itemRepository.save(item);
        // Save exchange history
        ExchangeHistory history = new ExchangeHistory();
        history.setStudent(student);
        history.setMarketplaceItem(item);
        history.setQuantityExchanged(quantityRequested);
        history.setTotalRosesSpent(totalCost);
        history.setExchangeDate(OffsetDateTime.now());
        historyRepository.save(history);
        return "Item exchanged successfully.";
    }

    public List<ExchangeHistoryDto> getExchangeHistory(String username) {
        Student student = studentDao.findByUsername(username)
                .orElseThrow(() -> new EntityNotFoundException("Student not found"));
        List<ExchangeHistory> historyList = historyRepository.findByStudentId(student.getId());
        return historyList.stream().map(history -> new ExchangeHistoryDto(
                history.getId(),
                history.getMarketplaceItem().getName(),
                history.getQuantityExchanged(),
                history.getTotalRosesSpent(),
                history.getExchangeDate()
        )).collect(Collectors.toList());
    }
}
