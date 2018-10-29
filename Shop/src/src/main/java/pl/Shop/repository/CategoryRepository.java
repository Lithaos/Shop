package pl.Shop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pl.Shop.model.CategoryOfProduct;

@Repository
public interface CategoryRepository extends JpaRepository<CategoryOfProduct, Long> {

	CategoryOfProduct findByCategoryName(String name);

}
