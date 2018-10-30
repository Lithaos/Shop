package pl.Shop.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pl.Shop.model.Cart;
import pl.Shop.model.Product;
import pl.Shop.repository.CartRepository;
import pl.Shop.repository.CategoryRepository;
import pl.Shop.repository.ProductRepository;

@Controller
public class ProductsController {

	@Autowired
	ProductRepository productsRepository;

	@Autowired
	CategoryRepository categoryRepository;

	@Autowired
	CartRepository cartRepository;

	@RequestMapping("/products")
	public String products(Model model) {
		model.addAttribute("products", productsRepository.findAll());
		return "products";
	}

	@RequestMapping(value = "/addProduct", method = RequestMethod.GET)
	public String addProduct(@ModelAttribute("products") Product product, Model model) {
		model.addAttribute("categories", categoryRepository.findAll());
		return "addProduct";
	}

	@RequestMapping(value = "/addProduct", method = RequestMethod.POST)
	public String addProduct(@ModelAttribute("products") @Valid Product product, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "addProduct";
		} else {
			Product newProduct = new Product();
			newProduct = product;
			productsRepository.save(newProduct);
			return "redirect:/products";
		}

	}

	@RequestMapping(value = "/deleteProduct/{productId}", method = RequestMethod.GET)
	public String deleteProduct(@PathVariable long productId, Model model) {
		Product memory = productsRepository.getOne(productId);

		List<Cart> carts = cartRepository.findAll();

		for (int i = 0; i < carts.size(); i++) {
			carts.get(i).getProducts().remove(productsRepository.getOne(productId));
		}

		productsRepository.delete(memory);
		return "redirect:/products";

	}

	@RequestMapping(value = "/products/{productId}")
	public String productDetail(@PathVariable long productId, Model model) {
		model.addAttribute("categories", categoryRepository.findAll());
		model.addAttribute("productDetail", productsRepository.getOne(productId));
		model.addAttribute("productId", productId);
		return "productDetail";
	}

	@RequestMapping(value = "/products/{productId}", method = RequestMethod.POST)
	public String EditProduct(@PathVariable long productId, @ModelAttribute("product") Product product, Model model) {
		Product memory = productsRepository.getOne(productId);
		memory.setProductName(product.getProductName());
		memory.setDescriptionOfProduct(product.getDescriptionOfProduct());
		memory.setPriceOfProduct(product.getPriceOfProduct());
		memory.setImgLink(product.getImgLink());
		memory.setCategory(product.getCategory());
		productsRepository.save(memory);
		return "redirect:/products";

	}

}
