package com.UserBack.DAO;

import java.util.List;

import com.UserBack.model.Category;

public interface CategoryDAO {

	public boolean addCategory(Category category);
	public List<Category> getAll();
	public Category getCategoryById(int CategoryID);
	public boolean updateCategory(Category category);
	public boolean deleteCategory(int CategoryID);
}
