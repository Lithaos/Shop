package pl.Shop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.Shop.model.OrdersHistory;

public interface OrdersHistoryRepository extends JpaRepository<OrdersHistory, Long> {
	
}