package pl.Shop.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pl.Shop.model.Cart;
import pl.Shop.model.OrdersHistory;
import pl.Shop.model.User;
import pl.Shop.repository.OrdersHistoryRepository;
import pl.Shop.repository.UserRepository;

@Controller
public class OrdersController {

	@Autowired
	private OrdersHistoryRepository ordersHistoryRepository;

	@Autowired
	private UserRepository userRepository;

	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String confirmOrder(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User user = userRepository.findByUserName(authentication.getName());
		model.addAttribute("productsInCart", user.getCart().getProducts());
		model.addAttribute("valeOfCart", user.getCart().getValue());
		model.addAttribute("orderDetail", user.getAddress());
		return "orderConfirm";

	}

	@RequestMapping(value = "/ordered", method = RequestMethod.GET)
	public String setOrder(Model model) {
		OrdersHistory newOrder = new OrdersHistory();
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User user = userRepository.findByUserName(authentication.getName());
		Cart cart = user.getCart();
		newOrder.setOrderDate(LocalDateTime.now());
		newOrder.setUserId(user.getId());
		newOrder.setCartId(cart);
		newOrder.setUserName(user.getUserName());
		newOrder.setValueOfOrder(cart.getValue());
		user.setCart(new Cart());
		ordersHistoryRepository.save(newOrder);
		model.addAttribute("productsInCart", user.getCart().getProducts());
		return "ordered";

	}

	@RequestMapping(value = "/history", method = RequestMethod.GET)
	public String viewHistory(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User user = userRepository.findByUserName(authentication.getName());
		List<OrdersHistory> history = ordersHistoryRepository.findAll();
		List<OrdersHistory> userHistory = new ArrayList<OrdersHistory>();
		for (OrdersHistory ordersHistory : history) {
			if (ordersHistory.getUserId() == user.getId()) {
				userHistory.add(ordersHistory);
			}
		}
		model.addAttribute("listOfOrders", userHistory);

		return "history";

	}

	@RequestMapping(value = "/order/{orderId}", method = RequestMethod.GET)
	public String orderDetails(@PathVariable long orderId, Model model) {
		model.addAttribute("order", ordersHistoryRepository.getOne(orderId));
		return "orderDetail";
	}

}
