package pl.Shop.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class UserOrder {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "USER_ORDER_ID")
	private int userOrderId;

	@OneToMany(mappedBy = "userOrder")
	private List<OrderedItem> orderedItem;

	public List<OrderedItem> getOrderedItem() {
		return orderedItem;
	}

	public void setOrderedItems(List<OrderedItem> orderedItems) {
		this.orderedItem = orderedItems;
	}

	public int getUserOrderId() {
		return this.userOrderId;
	}

	public void setUserOrderId(int orderId) {
		this.userOrderId = orderId;
	}

}