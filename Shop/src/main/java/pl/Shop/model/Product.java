package pl.Shop.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Entity
public class Product {

	@Id
	@GeneratedValue
	private Long id;

	@NotEmpty(message = "Musisz podać nazwę!")
	private String productName;

	private String descriptionOfProduct;

	@NotNull(message = "Musisz podać cenę!")
	@Min(value = 1, message = "Cena musi być większa od zera!")
	private Double priceOfProduct;
	

	private String category;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getDescriptionOfProduct() {
		return descriptionOfProduct;
	}

	public void setDescriptionOfProduct(String descriptionOfProduct) {
		this.descriptionOfProduct = descriptionOfProduct;
	}

	public Double getPriceOfProduct() {
		return priceOfProduct;
	}

	public void setPriceOfProduct(Double priceOfProduct) {
		this.priceOfProduct = priceOfProduct;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", productName=" + productName + ", descriptionOfProduct=" + descriptionOfProduct
				+ ", priceOfProduct=" + priceOfProduct + ", category=" + category + "]";
	}

	
}
