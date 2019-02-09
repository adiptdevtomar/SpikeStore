package com.UserBack.DAO;

import java.util.List;

import com.UserBack.model.Cart;
import com.UserBack.model.CartLine;
//import com.UserBack.model.OrderDetail;

public interface CartLineDAO {

	public List<CartLine> list(int cartId);

	public boolean addCart(Cart cart);
	
	public CartLine get(int id);

	public boolean add(CartLine cartLine);

	public boolean update(CartLine cartLine);

	public boolean remove(CartLine cartLine);

	// fetch the CartLine based on cartId and productId
	public CartLine getByCartAndProduct(int cartId, int productId);

	// updating the cart
	boolean updateCart(Cart cart);

	// list of available cartLine
	public List<CartLine> listAvailable(int cartId);

	public Cart getByMobile(String mobile);
	// adding order details
	// boolean addOrderDetail(OrderDetail orderDetail);

}