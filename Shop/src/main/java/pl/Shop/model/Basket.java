package pl.Shop.model;

import java.util.ArrayList;
import java.util.List;


public class Basket {

	private List<Product> listOfProducts = new ArrayList<>();

	private Double value = 0.0;

	public List<Product> getListOfProducts() {
		return listOfProducts;
	}

	public void setListOfProducts(List<Product> listOfProducts) {
		this.listOfProducts = listOfProducts;
	}

	public Double getValue() {
		return value;
	}

	public void setValue(Double value) {
		this.value = value;
	}

}
