package com.UserBack.DAO;

import java.util.List;

import com.UserBack.model.User;

public interface UserDAO {
	
	public boolean addUser(User user);
	public boolean updateUser(User user);
	public boolean deleteUser(String mobile);
	public User getSingleUser(String mobile);
	public List<User> getAllUser();
}
