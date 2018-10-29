package pl.Shop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pl.Shop.model.CategoryOfProduct;
import pl.Shop.model.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

	CategoryOfProduct findByProductName(String name);

}
