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
	

	private Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	private User user = userRepository.findByUserName(authentication.getName());
	@RequestMapping("/cart")
	public String cart(Model model) {
		model.addAttribute("productsInCart",user.getCart().getProducts());
		return "cart";
	}
	
	@RequestMapping("/deleteFromCart/{productsId}")
	public String removeFromCart(@PathVariable long productId, Model model) {
		
		// To do!
		
		return "redirect:/cart";
	}

	@RequestMapping(value = "/addToCart/{productId}", method = RequestMethod.GET)
	public String addToCart(@PathVariable long productId, Model model) {
		Product product = productsRepository.getOne(productId);
		User user = userRepository.findByUserName(authentication.getName());
		if (user.getCart() == null) {
			user.setCart(new Cart());
			user.getCart().getProducts().add(product);
			userRepository.save(user);
		} else {
			if (user.getCart().getProducts().contains(product)) {

			} else {
				user.getCart().getProducts().add(product);
				userRepository.save(user);
			}
		}
		
		
		return "redirect:/cart";

	}
}
