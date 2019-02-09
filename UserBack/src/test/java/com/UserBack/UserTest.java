package com.UserBack;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.UserBack.DAO.UserDAO;
import com.UserBack.model.User;

public class UserTest {

	private static AnnotationConfigApplicationContext context = null;
	private static UserDAO userDAO = null;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {

		context = new AnnotationConfigApplicationContext();
		context.scan("com.UserBack");
		context.refresh();
		userDAO = (UserDAO) context.getBean("userDAO");

	}

	@Test
	public void testAddUser() {
		User obj=new User();
		obj.setName("Akshat");
		obj.setMobile("7275099881");
		obj.setEmail("Akshat111@gmail.com");
		obj.setPassword("123456");
		assertTrue("cannot Save",userDAO.addUser(obj));
	}

	@Test
	public void testUpdateUser() {
		fail("Not yet implemented");
	}

	@Test
	public void testDeleteUser() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetSingleUser() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetAllUser() {
		fail("Not yet implemented");
	}

}
