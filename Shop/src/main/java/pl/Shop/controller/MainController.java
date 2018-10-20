package pl.Shop.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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

	@RequestMapping("/users")
	public String users(Model model) {
		model.addAttribute("users", userRepository.findAll());
		return "users";
	}

	@RequestMapping(value = "/user/{userId}")
	public String users(@PathVariable long userId, Model model) {
		model.addAttribute("userDetail", userRepository.getOne(userId));
		model.addAttribute("userId", userId);
		return "userDetail";
	}

	@RequestMapping(value = "/user/{userId}", method = RequestMethod.POST)
	public String saveUser(@PathVariable long userId, @ModelAttribute("user") User user, BindingResult result,
			Model model) {
		User memory = userRepository.getOne(userId);
		memory.setUserName(user.getUserName());
		memory.setEmail(user.getEmail());
		memory.setRole(user.getRole());
		userRepository.save(memory);
		return "redirect:/users";

	}

	@RequestMapping(value = "/delete/{userId}", method = RequestMethod.GET)
	public String deleteUser(@PathVariable long userId, @ModelAttribute("user") User user, BindingResult result,
			Model model) {
		User memory = userRepository.getOne(userId);
		userRepository.delete(memory);
		return "redirect:/users";

	}

}
