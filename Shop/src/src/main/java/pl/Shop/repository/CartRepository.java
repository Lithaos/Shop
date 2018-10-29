package pl.Shop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.Shop.model.Cart;

public interface CartRepository extends JpaRepository<Cart, Long> {

}