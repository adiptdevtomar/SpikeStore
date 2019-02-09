package com.SpikeStore.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.UserBack.DAO.CategoryDAO;
import com.UserBack.model.Category;

@ControllerAdvice
public class GlobalController {
	@Autowired
	CategoryDAO categoryDAO;
	
	@ModelAttribute("Categorylst")
	public List<Category> getCategory(){
		return categoryDAO.getAll();
	}

}
