package pl.Shop.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pl.Shop.model.Address;
import pl.Shop.model.Cart;
import pl.Shop.model.User;
import pl.Shop.repository.CategoryRepository;
import pl.Shop.repository.UserRepository;

@Controller
public class MainController {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private CategoryRepository categoryRepository;

	private Authentication authentication;
	private User user;

	@RequestMapping("/")
	public String main(Model model) {
		authentication = SecurityContextHolder.getContext().getAuthentication();
		if (!(authentication instanceof AnonymousAuthenticationToken)) {
			user = userRepository.findByUserName(authentication.getName());
			model.addAttribute("productsInCart", user.getCart().getProducts());
		}

		model.addAttribute("categories", categoryRepository.findAll());
		return "home";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String formularz(@ModelAttribute("user") User user, Model model) {
		return "register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registration(@ModelAttribute("user") @Valid User user, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "register";
		} else {
			User newUser = new User();
			newUser = user;
			newUser.setAddress(new Address());
			newUser.setCart(new Cart());
			userRepository.save(newUser);
			return "home";
		}
	}

	@RequestMapping("/login")
	public String login(Model model) {
		return "login";
	}

	@RequestMapping("/403")
	public String noPermision() {
		return "error";
	}
}
