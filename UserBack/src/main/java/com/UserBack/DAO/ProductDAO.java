package com.UserBack.DAO;

import java.util.List;

import org.springframework.stereotype.Controller;

import com.UserBack.model.Product;

@Controller
public interface ProductDAO {

	public boolean addProduct(Product product);
	public boolean deleteProduct(int productID);
	public Product getSingleProduct(int productID);
	public boolean updateProduct(Product product);
	public List<Product> getAllProduct();
	public List<Product> listSelected(String categoryID);
	public List<Product> mostViewedProducts();
	public List<Product> listByIdol(String Idol);
	public List<Product> getProductBySearch(String s);
}
