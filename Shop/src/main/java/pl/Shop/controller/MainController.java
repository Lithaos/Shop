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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pl.Shop.model.User;
import pl.Shop.repository.CategoryRepository;
import pl.Shop.repository.UserRepository;

@Controller
public class MainController {

	@Autowired
	UserRepository userRepository;
	
	@Autowired
	CategoryRepository categoryRepository;

	@RequestMapping("/")
	public String main(Model model) {
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
	
	@RequestMapping(value ="/myaccount", method = RequestMethod.GET)
	public String myAccount(Principal principal,Model model) {
		String currentPrincipalName = principal.getName();
		model.addAttribute("principal", userRepository.findByUserName(currentPrincipalName));
		return "myAccount";
	}

	@RequestMapping(value ="/myaccount", method = RequestMethod.POST)
	public String myAccount(@ModelAttribute("principal") @Valid User principal, BindingResult result, Model model) {
		
		if (result.hasErrors()) {
			System.out.println(result.getAllErrors());
			return "myaccount";
		}
		else
		{
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			User user = userRepository.findByUserName(authentication.getName());
			user.setUserName(principal.getUserName());
			user.setPassword(principal.getPassword());
			user.setEmail(principal.getEmail());
			userRepository.save(user);
			UsernamePasswordAuthenticationToken authRequest = new UsernamePasswordAuthenticationToken(user.getUserName(), user.getPassword());
			SecurityContextHolder.getContext().setAuthentication(authRequest);		
			return "redirect:/myaccount";
		}
		
	}
}
