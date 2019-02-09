package com.UserBack.DAO.Impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.UserBack.DAO.ProductDAO;
import com.UserBack.model.Product;

@Repository("productDAO")
@Transactional
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public boolean addProduct(Product product) {
		try {
			sessionFactory.getCurrentSession().save(product);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean updateProduct(Product product) {
		try {
			sessionFactory.getCurrentSession().update(product);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean deleteProduct(int productID) {
		try {
			sessionFactory.getCurrentSession().delete(getSingleProduct(productID));
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	@Override
	public Product getSingleProduct(int productID) {
		try {
			return sessionFactory.getCurrentSession().get(Product.class, productID);
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> getAllProduct() {
		try {
			return sessionFactory.getCurrentSession().createQuery("from Product").list();
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	@Override
	public List<Product> listSelected(String categoryID){
		try {
		String query = "From Product WHERE categoryID = :categoryID";
		return sessionFactory.getCurrentSession().createQuery(query, Product.class).setParameter("categoryID", categoryID).getResultList();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> mostViewedProducts() {
		try {
			return sessionFactory.getCurrentSession().createQuery("from Product order by views desc").list();
		}
		catch(Exception ex) {
			ex.printStackTrace();
			return null;
		}
		
	}

	@Override
	public List<Product> listByIdol(String Idol) {
		try {
			String query = "From Product WHERE Idol = :Idol";
			return sessionFactory.getCurrentSession().createQuery(query, Product.class).setParameter("Idol", Idol).getResultList();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return null;
		}
	}
	
	@Override
	public List<Product> getProductBySearch(String s){
		try {
			List<Product> lst=sessionFactory.getCurrentSession().createQuery("from Product where productname LIKE '%"+s+"%'" ).list();
			return lst;
	}catch(Exception ex)
		{
		ex.printStackTrace();
		return null;
		}
		} 
}
