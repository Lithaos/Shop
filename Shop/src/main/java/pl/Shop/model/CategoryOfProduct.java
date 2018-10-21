package pl.Shop.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.validation.constraints.NotEmpty;

@Entity
public class CategoryOfProduct {

	@Id
	@GeneratedValue
	private Long id;

	@NotEmpty(message = "Musisz podać nazwę kategorii!")
	private String categoryName;

	private String descriptionOfCategory;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getDescriptionOfCategory() {
		return descriptionOfCategory;
	}

	public void setDescriptionOfCategory(String descriptionOfCategory) {
		this.descriptionOfCategory = descriptionOfCategory;
	}

}
