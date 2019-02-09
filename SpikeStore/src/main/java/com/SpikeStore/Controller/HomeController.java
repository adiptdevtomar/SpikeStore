package com.SpikeStore.Controller;

import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.UserBack.DAO.CartLineDAO;
import com.UserBack.DAO.CategoryDAO;
import com.UserBack.DAO.ProductDAO;
import com.UserBack.DAO.UserDAO;
import com.UserBack.model.Cart;
import com.UserBack.model.CartLine;
import com.UserBack.model.Category;
import com.UserBack.model.Product;
import com.UserBack.model.User;

@Controller
public class HomeController {

	@Autowired
	UserDAO userDAO;

	@Autowired
	CartLineDAO cartLineDAO;

	@Autowired
	Cart cart;

	@Autowired
	CartLine cartLine;

	@Autowired
	ProductDAO productDAO;

	@Autowired
	CategoryDAO categoryDAO;

	@RequestMapping(value = { "/", "/home", "/index", "/Homepage" })
	public String home(Model model, HttpSession session) {
		model.addAttribute("category", new Category());
		model.addAttribute("Categorylst", categoryDAO.getAll());
		List<Product> prodlist = productDAO.mostViewedProducts();
		/*
		 * int big=0; int ProdID=0; for(int i=37;i<=(prodlist.size()+36);i++) { Product
		 * prod=productDAO.getSingleProduct(i); if(prod.getViews() > big) {
		 * ProdID=prod.getProductID(); } }
		 */
		// System.out.println(ProdID);
		model.addAttribute("productList", prodlist);
		return "Homepage";
	}

	@RequestMapping("/AboutUs")
	public String AboutUs(){
		return "AboutUs";
	}
	@RequestMapping("/ContactUs")
	public String ContactUs(){
		return "ContactUs";
	}
	@RequestMapping("/ThankYou")
	public String ThankYou() {
		return "ThankYou";
	}
	@RequestMapping("/SignUp")
	public String SignUp(Model model) {
		model.addAttribute("user", new User());
		return "SignUp";
	}

	@RequestMapping(value = "/regUser", method = RequestMethod.POST)
	public String regUser(@ModelAttribute("User") User user) {

		user.setRole("ROLE_USER");
		user.setEnable(true);
		userDAO.addUser(user);
		cart.setUser(user);
		cartLineDAO.addCart(cart);
		return "Homepage";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Invalid username or password!");
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("login");

		return model;

	}

	@RequestMapping(value = "/login_success")
	public String loginSuccess(HttpSession session, Model model) {
		System.out.println("=========== Successful Login ===========");

		boolean loggedIn = true;
		// Retrieving the username
		String username = SecurityContextHolder.getContext().getAuthentication().getName();

		Cart cart = cartLineDAO.getByMobile(username);
		List<CartLine> lst = cartLineDAO.list(cart.getId());
		session.setAttribute("size", lst.size());
		session.setAttribute("username", username);
		session.setAttribute("loggedIn", loggedIn);
		User user = userDAO.getSingleUser(username);
		session.setAttribute("user", user);
		model.addAttribute("category", new Category());
		model.addAttribute("Categorylst", categoryDAO.getAll());
		return "redirect:/Homepage";
	}

	@RequestMapping(value = "/addcart/{productID}")
	public String pr1(@PathVariable("productID") int productID, @RequestParam("qty") int quntity, HttpSession session,

			Model model) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String mobile = auth.getName();
		System.out.println(mobile);
		Cart cart = cartLineDAO.getByMobile(mobile);
		System.out.println(cart.getId());
		Product obj = productDAO.getSingleProduct(productID);
		System.out.println(obj.getProductID());
		List<CartLine> lst = cartLineDAO.listAvailable(cart.getId());
		boolean flag = false;
		int id = 0;
		for (CartLine crtln : lst) {
			if (crtln.getProduct().getProductID() == obj.getProductID()) {
				flag = true;
				id = crtln.getId();
				break;
			}
		}
		if (flag) {

			cartLine = cartLineDAO.get(id);

			cartLine.setProductCount(cartLine.getProductCount() + 1);
			cartLine.setTotal(cartLine.getProductCount() * cartLine.getBuyingPrice());
			cartLineDAO.update(cartLine);
		} else {
			cartLine.setProduct(obj);
			cartLine.setProductCount(quntity);
			cartLine.setBuyingPrice(Double.parseDouble(obj.getPrice()));
			cartLine.setCartId(cart.getId());
			System.out.println(quntity);
			System.out.println(obj.getPrice());
			System.out.println(mobile);
			System.out.println(cart.getId());
			cartLine.setTotal(quntity * Double.parseDouble(obj.getPrice()));
			cartLineDAO.add(cartLine);
		}

		lst = cartLineDAO.list(cart.getId());

		cart.setGrandTotal(this.getGrandTotal(lst));
		cart.setCartLines(cartLineDAO.listAvailable(cart.getId()).size());
		cartLineDAO.updateCart(cart);

		session.setAttribute("size", lst.size());
		return "redirect:/Cart";

	}

	@RequestMapping(value = "/updatecart/{cartLineId}")
	public String updateCart(@PathVariable("cartLineId") int cartLineId, @RequestParam("qty") int qty,
			HttpSession session) {
		cartLine = cartLineDAO.get(cartLineId);
		if (qty == 0) {
			cartLineDAO.remove(cartLine);
		} else {

			cartLine.setProductCount(qty);
			cartLine.setTotal(qty * Double.parseDouble(cartLine.getProduct().getPrice()));

			User user = (User) session.getAttribute("user");
			cart = cartLineDAO.getByMobile(user.getMobile());

			cartLineDAO.update(cartLine);
		}
		cart.setGrandTotal(this.getGrandTotal(cartLineDAO.list(cart.getId())));
		cart.setCartLines(cartLineDAO.listAvailable(cart.getId()).size());
		cartLineDAO.updateCart(cart);

		return "redirect:/Cart";
	}

	@RequestMapping("/Cart")
	public String cart(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String mobile = auth.getName();
		Cart cart = cartLineDAO.getByMobile(mobile);
		model.addAttribute("cartList", cartLineDAO.listAvailable(cart.getId()));
		model.addAttribute("grandTotal", cart.getGrandTotal());
		return "Cart";
	}

	@RequestMapping("/Bill")
	public String bill(Model model, HttpSession session) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String mobile = auth.getName();
		Cart cart = cartLineDAO.getByMobile(mobile);
		model.addAttribute("U1", cart.getUser());
		model.addAttribute("U2", cart.getId());
		model.addAttribute("U3", cart.getGrandTotal());
		model.addAttribute("C1", cartLineDAO.listAvailable(cart.getId()));

		return "Bill";
	}

	@RequestMapping(value = "/delCartLine/{cartLineID}")
	public String pr2(@PathVariable("cartLineID") int cartLineID, HttpSession session) {

		CartLine cartLine = cartLineDAO.get(cartLineID);
		cartLineDAO.remove(cartLine);
		String username = SecurityContextHolder.getContext().getAuthentication().getName();

		Cart cart = cartLineDAO.getByMobile(username);
		cart.setGrandTotal(this.getGrandTotal(cartLineDAO.list(cart.getId())));
		cartLineDAO.updateCart(cart);

		List<CartLine> lst = cartLineDAO.list(cart.getId());
		session.setAttribute("size", lst.size());
		return "redirect:/Cart";
	}

	@RequestMapping(value = "/quantity", method = RequestMethod.POST)
	public String quantity(@ModelAttribute("cartLine") CartLine cartLine) {
		cartLineDAO.update(cartLine);
		return "redirect:/cartLine";
	}

	@RequestMapping(value = "/cartLine", method = RequestMethod.POST)
	public String cartLine(Model model) {
		model.addAttribute("cartLine", new CartLine());
		return "Cart";
	}

	private int getGrandTotal(List<CartLine> lst) {
		int grandTotal = 0;
		for (CartLine cartLine : lst) {
			grandTotal += cartLine.getTotal();
		}

		System.out.println("GrandTotal==========>" + grandTotal);
		return grandTotal;
	}

	@RequestMapping(value = "/addBill/{productID}")
	public String pr2(@PathVariable("productID") int productID, @RequestParam("qty") int quntity, HttpSession session,

			Model model) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String mobile = auth.getName();
		System.out.println(mobile);
		Cart cart = cartLineDAO.getByMobile(mobile);
		System.out.println(cart.getId());
		Product obj = productDAO.getSingleProduct(productID);
		System.out.println(obj.getProductID());
		List<CartLine> lst = cartLineDAO.listAvailable(cart.getId());
		boolean flag = false;
		int id = 0;
		for (CartLine crtln : lst) {
			if (crtln.getProduct().getProductID() == obj.getProductID()) {
				flag = true;
				id = crtln.getId();
				break;
			}
		}
		if (flag) {

			cartLine = cartLineDAO.get(id);

			cartLine.setProductCount(cartLine.getProductCount() + 1);
			cartLine.setTotal(cartLine.getProductCount() * cartLine.getBuyingPrice());
			cartLineDAO.update(cartLine);
		} else {
			cartLine.setProduct(obj);
			cartLine.setProductCount(quntity);
			cartLine.setBuyingPrice(Double.parseDouble(obj.getPrice()));
			cartLine.setCartId(cart.getId());
			System.out.println(quntity);
			System.out.println(obj.getPrice());
			System.out.println(mobile);
			System.out.println(cart.getId());
			cartLine.setTotal(quntity * Double.parseDouble(obj.getPrice()));
			cartLineDAO.add(cartLine);
		}

		lst = cartLineDAO.list(cart.getId());

		cart.setGrandTotal(this.getGrandTotal(lst));
		cart.setCartLines(cartLineDAO.listAvailable(cart.getId()).size());
		cartLineDAO.updateCart(cart);

		return "redirect:/Bill";
	}
}
