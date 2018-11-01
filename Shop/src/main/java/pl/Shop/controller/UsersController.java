package pl.Shop.controller;

import java.security.Principal;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pl.Shop.model.Address;
import pl.Shop.model.User;
import pl.Shop.repository.UserRepository;

@Controller
public class UsersController {

	@Autowired
	private UserRepository userRepository;

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

	@RequestMapping(value = "/deleteUser/{userId}", method = RequestMethod.GET)
	public String deleteUser(@PathVariable long userId, @ModelAttribute("user") User user, BindingResult result,
			Model model) {
		User memory = userRepository.getOne(userId);
		userRepository.delete(memory);
		return "redirect:/users";

	}

	private Boolean success = false;

	@RequestMapping(value = "/myaccount", method = RequestMethod.GET)
	public String myAccount(Principal principal, Model model) {
		if (success) {
			model.addAttribute("created", true);
		}
		success = false;
		model.addAttribute("user", userRepository.findByUserName(principal.getName()));
		return "myAccount";
	}

	@RequestMapping(value = "/editaccount", method = RequestMethod.GET)
	public String editAccount(Model model) {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (!authentication.isAuthenticated()) {
			return "login";
		} else {
			String currentPrincipalName = authentication.getName();
			model.addAttribute("principal", userRepository.findByUserName(currentPrincipalName));
			return "editAccount";

		}
	}

	@RequestMapping(value = "/editaccount", method = RequestMethod.POST)
	public String editAccount(@ModelAttribute("principal") @Valid User principal, BindingResult result, Model model) {

		if (result.hasErrors()) {
			success = false;
			return "editAccount";

		} else {
			success = true;
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			User user = userRepository.findByUserName(authentication.getName());
			user.setUserName(principal.getUserName());
			user.setPassword(principal.getPassword());
			user.setEmail(principal.getEmail());
			userRepository.save(user);
			UsernamePasswordAuthenticationToken authRequest = new UsernamePasswordAuthenticationToken(
					user.getUserName(), user.getPassword());
			SecurityContextHolder.getContext().setAuthentication(authRequest);
			return "redirect:/myaccount";
		}

	}

	@RequestMapping(value = "/editaddress", method = RequestMethod.GET)
	public String editAddress(Principal principal, Model model) {
		String currentPrincipalName = principal.getName();
		model.addAttribute("newAddress", userRepository.findByUserName(currentPrincipalName).getAddress());
		return "editAddress";
	}

	@RequestMapping(value = "/editaddress", method = RequestMethod.POST)
	public String editAddress(@ModelAttribute("newAddress") @Valid Address newAddress, BindingResult result,
			Model model) {
		success = true;
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User user = userRepository.findByUserName(authentication.getName());
		Address address = user.getAddress();
		address.setCity(newAddress.getCity());
		address.setNumber(newAddress.getNumber());
		address.setStreet(newAddress.getStreet());
		userRepository.save(user);
		return "redirect:/myaccount";

	}

}
