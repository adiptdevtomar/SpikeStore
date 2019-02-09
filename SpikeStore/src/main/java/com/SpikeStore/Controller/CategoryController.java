package com.SpikeStore.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.UserBack.DAO.CategoryDAO;
import com.UserBack.model.Category;

@Controller
public class CategoryController {

	@Autowired
	CategoryDAO categoryDAO;

	@RequestMapping("/category")
	public String ShowCategory(Model model) {
		model.addAttribute("UserClickedcategory", "true");
		model.addAttribute("category", new Category());
		model.addAttribute("catlist", categoryDAO.getAll());

		return "showcategory";
	}

	// @PostMapping()
	@RequestMapping(value = "/SaveCategory", method = RequestMethod.POST)
	public String SaveCategory(@ModelAttribute("category") Category category) {

		categoryDAO.addCategory(category);

		return "redirect:/category";
	}

	@RequestMapping(value = "/editcat/{catid}")
	public String EditClicked(@PathVariable("catid") int catid, Model model) {

		model.addAttribute("userclickededit", "true");
		model.addAttribute("category", categoryDAO.getCategoryById(catid));
		model.addAttribute("catlist", categoryDAO.getAll());

		return "redirect:/showcategory";
	}

	@RequestMapping(value = "/deletecat/{catid}")
	public String deleteclicked(@PathVariable("catid") int catid, Model model) {
		model.addAttribute("userclickededit", "true");
		categoryDAO.deleteCategory(catid);
		return "redirect:/showcategory";
	}

	@RequestMapping(value = "/UpdateCategory", method = RequestMethod.POST)
	public String UpdateCategory(@ModelAttribute("category") Category category) {

		categoryDAO.updateCategory(category);

		return "redirect:/category";
	}

	@RequestMapping("/showcategory")
	public String SignUp(Model model) {
		model.addAttribute("category", new Category());
		model.addAttribute("catlist", categoryDAO.getAll());
		return "showcategory";
	}
}
