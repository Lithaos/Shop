package pl.Shop.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class OrderedItem {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int orderedItemId;

	private int quantity;

	@ManyToOne
	@JoinColumn(name = "USER_ORDER_ID")
	private UserOrder userOrder;

	@ManyToOne
	@JoinColumn(name = "PRODUCT_ID")
	private Product product;

	public UserOrder getUserOrder() {
		return userOrder;
	}

	public void setUserOrder(UserOrder userOrder) {
		this.userOrder = userOrder;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getOrderedItemId() {
		return this.orderedItemId;
	}

	public void setOrderedItemId(int orderedItemId) {
		this.orderedItemId = orderedItemId;
	}

	public int getQuantity() {
		return this.quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
