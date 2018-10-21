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

import pl.Shop.model.CategoryOfProduct;
import pl.Shop.repository.CategoryRepository;

@Controller
public class CategoriesController {

	@Autowired
	CategoryRepository categoryRepository;

	@RequestMapping("/categories")
	public String categories(Model model) {
		model.addAttribute("categories", categoryRepository.findAll());
		return "categories";
	}

	@RequestMapping(value = "/addCategory", method = RequestMethod.GET)
	public String addCategory(@ModelAttribute("categories") CategoryOfProduct category, Model model) {
		return "addCategory";
	}

	@RequestMapping(value = "/addCategory", method = RequestMethod.POST)
	public String addCategory(@ModelAttribute("categories") @Valid CategoryOfProduct category, BindingResult result,
			Model model) {
		if (result.hasErrors()) {
			return "addCategory";
		} else {
			CategoryOfProduct newCategory = new CategoryOfProduct();
			newCategory = category;
			categoryRepository.save(newCategory);
			return "redirect:/categories";
		}

	}

	@RequestMapping(value = "/deleteCategory/{categoryId}", method = RequestMethod.GET)
	public String deleteCategory(@PathVariable long categoryId, Model model) {
		CategoryOfProduct memory = categoryRepository.getOne(categoryId);
		categoryRepository.delete(memory);
		return "redirect:/categories";

	}

}
