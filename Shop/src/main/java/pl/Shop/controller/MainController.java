package pl.Shop.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pl.Shop.model.User;
import pl.Shop.repository.UserRepository;

@Controller
public class MainController {

	@Autowired
	UserRepository userRepository;

	@RequestMapping("/")
	public String main(Model model) {
		return "home";
	}

	@RequestMapping(value = "/formularz", method = RequestMethod.GET)
	public String formularz(@ModelAttribute("user") User user, Model model) {
		return "formularz";
	}

	@RequestMapping(value = "/formularz", method = RequestMethod.POST)
	public String registration(@ModelAttribute("user") @Valid User user, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "formularz";
		} else {
			User newUser = new User();
			newUser = user;
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
