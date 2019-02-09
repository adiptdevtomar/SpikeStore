package com.SpikeStore.Controller;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.UserBack.DAO.CategoryDAO;
import com.UserBack.DAO.ProductDAO;
import com.UserBack.model.Product;

@Controller
public class ProductController {

	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	ProductDAO productDAO;

	@RequestMapping("/product")
	public String ShowProduct(Model model) {
		model.addAttribute("UserClickedproduct", "true");
		model.addAttribute("product", new Product());
		model.addAttribute("productlist", productDAO.getAllProduct());
		model.addAttribute("catlist", categoryDAO.getAll());

		return "addproduct";
	}

	@RequestMapping("/addproduct")
	public String addproduct(Model model) {
		model.addAttribute("product", new Product());
		model.addAttribute("productlist", productDAO.getAllProduct());
		model.addAttribute("catlist", categoryDAO.getAll());
		return "addproduct";
	}

	@RequestMapping(value = "/editprod/{prodid}")
	public String EditClicked(@PathVariable("prodid") int prodid, Model model) {

		model.addAttribute("userclickededit", "true");
		model.addAttribute("product", productDAO.getSingleProduct(prodid));
		model.addAttribute("productlist", productDAO.getAllProduct());
		model.addAttribute("catlist", categoryDAO.getAll());

		return "addproduct";
	}

	@RequestMapping(value = "/DisplaySingleprod/{prodID}")
	public String displaysingleprod(@PathVariable("prodID") int prodID, Model model) {
		model.addAttribute("productlist", productDAO.getSingleProduct(prodID));
		Product product = productDAO.getSingleProduct(prodID);
		product.setViews(product.getViews() + 1);
		productDAO.updateProduct(product);
		return "DisplaySingleprod";
	}

	@RequestMapping(value = "/Saveproduct", method = RequestMethod.POST)
	public String SaveProduct(@ModelAttribute("product") Product product, @RequestParam("file1") MultipartFile file1,
			@RequestParam("file2") MultipartFile file2, @RequestParam("file3") MultipartFile file3,
			@RequestParam("file4") MultipartFile file4) {

		if (file1.isEmpty()) {
			return "redirect:/product";
		}
		try {
			String dir = "C:\\Users\\hp\\eclipse-workspace\\facebook\\SpikeStore\\src\\main\\webapp\\resources\\images\\"
					+ product.getCode() + "\\";
			new File(dir).mkdir();

			Path path1 = Paths.get(dir + "1.jpg");
			byte arr1[] = file1.getBytes();
			Files.write(path1, arr1);

			Path path2 = Paths.get(dir + "2.jpg");
			byte arr2[] = file2.getBytes();
			Files.write(path2, arr2);

			Path path3 = Paths.get(dir + "3.jpg");
			byte arr3[] = file3.getBytes();
			Files.write(path3, arr3);

			Path path4 = Paths.get(dir + "4.jpg");
			byte arr4[] = file4.getBytes();
			Files.write(path4, arr4);

		} catch (Exception e) {
			e.printStackTrace();
		}
		productDAO.addProduct(product);
		return "redirect:/product";
	}

	@RequestMapping(value = "/Updateproduct", method = RequestMethod.POST)
	public String UpdateProduct(@ModelAttribute("product") Product product) {

		productDAO.updateProduct(product);

		return "redirect:/product";
	}

	@RequestMapping(value = "/delprod/{prodID}")
	public String deleteProd(@PathVariable("prodID") int prodID, Model model) {
		model.addAttribute("userclickededit", "true");
		productDAO.deleteProduct(prodID);
		return "redirect:/product";
	}

	@RequestMapping(value = "/Displayprod")
	public String Displayprod() {
		return "/Displayprod";
	}

	@RequestMapping(value = "/searchById/{catID}")
	public String SearchById(@PathVariable("catID") String catID, Model model, HttpSession session) {
		session.setAttribute("prolist", productDAO.listSelected(catID));
		return "Displayprod";
	}

	@RequestMapping(value = "/searchByIdol/{Idol}")
	public String SearchByIdol(@PathVariable("Idol") String Idol, Model model, HttpSession session) {
		session.setAttribute("prolist", productDAO.listByIdol(Idol));
		return "Displayprod";
	}

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String search(@RequestParam("s") String s, HttpSession session) {
		session.setAttribute("prolist", productDAO.getProductBySearch(s));
		return "Displayprod";
	}
}