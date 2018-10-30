package pl.Shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pl.Shop.model.Cart;
import pl.Shop.model.Product;
import pl.Shop.model.User;
import pl.Shop.repository.ProductRepository;
import pl.Shop.repository.UserRepository;

@Controller
public class CartController {

	@Autowired
	ProductRepository productsRepository;

	@Autowired
	UserRepository userRepository;

	private Authentication authentication;
	private User user;

	@RequestMapping("/cart")
	public String cart(Model model) {
		authentication = SecurityContextHolder.getContext().getAuthentication();
		user = userRepository.findByUserName(authentication.getName());
		model.addAttribute("productsInCart", user.getCart().getProducts());
		model.addAttribute("valeOfCart", user.getCart().getValue());
		if (user.getCart() == null) {
			user.setCart(new Cart());
			userRepository.save(user);
		}
		return "cart";
	}

	@RequestMapping(value = "/deleteFromCart/{productsId}", method = RequestMethod.GET)
	public String removeFromCart(@PathVariable long productsId, Model model) {
		authentication = SecurityContextHolder.getContext().getAuthentication();
		user = userRepository.findByUserName(authentication.getName());
		user.getCart().getProducts().remove(productsRepository.getOne(productsId));
		user.getCart().setValue(user.getCart().getValue() - productsRepository.getOne(productsId).getPriceOfProduct());
		userRepository.save(user);
		return "redirect:/cart";
	}

	@RequestMapping(value = "/addToCart/{productId}", method = RequestMethod.GET)
	public String addToCart(@PathVariable long productId, Model model) {
		authentication = SecurityContextHolder.getContext().getAuthentication();
		user = userRepository.findByUserName(authentication.getName());
		Product product = productsRepository.getOne(productId);
		if (user.getCart() == null) {
			user.setCart(new Cart());
			user.getCart().getProducts().add(product);
			user.getCart().setValue(product.getPriceOfProduct());
			userRepository.save(user);
		} else {
			if (user.getCart().getProducts().contains(product)) {

			} else {
				user.getCart().getProducts().add(product);
				user.getCart().setValue(user.getCart().getValue() + product.getPriceOfProduct());
				userRepository.save(user);
			}
		}

		return "redirect:/cart";

	}

}
