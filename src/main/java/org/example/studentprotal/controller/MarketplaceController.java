package org.example.studentprotal.controller;

import lombok.RequiredArgsConstructor;
import org.example.studentprotal.dto.MarketplaceItemDto;
import org.example.studentprotal.dto.ExchangeHistoryDto;
import org.example.studentprotal.service.MarketplaceService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/api/student-portal/marketplace")
@RequiredArgsConstructor
public class MarketplaceController {

    private final MarketplaceService marketplaceService;

    // Admin endpoints
    @PostMapping("/item")
    public ResponseEntity<String> createMarketplaceItem(
            @RequestParam("name") String name,
            @RequestParam("description") String description,
            @RequestParam("quantity") int quantity,
            @RequestParam("price") int price,
            @RequestParam("category") String category,
            @RequestParam("image") MultipartFile imageFile
    ) throws IOException {
        marketplaceService.createMarketplaceItem(name, description, quantity, price, imageFile.getBytes(), category);
        return ResponseEntity.ok("Marketplace item created successfully.");
    }

    @PutMapping("/item/{id}")
    public ResponseEntity<String> updateMarketplaceItem(
            @PathVariable("id") Integer id,
            @RequestParam("name") String name,
            @RequestParam("description") String description,
            @RequestParam("quantity") int quantity,
            @RequestParam("price") int price,
            @RequestParam("category") String category,
            @RequestParam(value = "image", required = false) MultipartFile imageFile
    ) throws IOException {
        byte[] image = null;
        if (imageFile != null && !imageFile.isEmpty()) {
            image = imageFile.getBytes();
        }
        marketplaceService.updateMarketplaceItem(id, name, description, quantity, price, image, category);
        return ResponseEntity.ok("Marketplace item updated successfully.");
    }

    @DeleteMapping("/item/{id}")
    public ResponseEntity<String> deleteMarketplaceItem(@PathVariable("id") Integer id) {
        marketplaceService.deleteMarketplaceItem(id);
        return ResponseEntity.ok("Marketplace item deleted successfully.");
    }

    // User endpoints
    @GetMapping("/items")
    public ResponseEntity<List<MarketplaceItemDto>> getAllMarketplaceItems() {
        List<MarketplaceItemDto> items = marketplaceService.getAllMarketplaceItems();
        return ResponseEntity.ok(items);
    }

    @PostMapping("/item/{id}/exchange")
    public ResponseEntity<String> exchangeItem(
            @PathVariable("id") Integer id,
            @RequestParam("username") String username,
            @RequestParam("quantity") int quantity
    ) {
        String response = marketplaceService.exchangeItem(id, username, quantity);
        return ResponseEntity.ok(response);
    }

    @GetMapping("/exchange-history")
    public ResponseEntity<List<ExchangeHistoryDto>> getExchangeHistory(@RequestParam("username") String username) {
        List<ExchangeHistoryDto> history = marketplaceService.getExchangeHistory(username);
        return ResponseEntity.ok(history);
    }
}
