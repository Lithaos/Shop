package pl.Shop.model;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class OrdersHistory {

	@Id
	@GeneratedValue
	private long id;

	private long userId;

	private String userName;

	private LocalDateTime orderDate;

	private double valueOfOrder;

	@OneToOne
	private Cart cartId;

	public long getId() {
		return id;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public LocalDateTime getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(LocalDateTime orderDate) {
		this.orderDate = orderDate;
	}

	public double getValueOfOrder() {
		return valueOfOrder;
	}

	public void setValueOfOrder(double valueOfOrder) {
		this.valueOfOrder = valueOfOrder;
	}

	public Cart getCartId() {
		return cartId;
	}

	public void setCartId(Cart cartId) {
		this.cartId = cartId;
	}

}