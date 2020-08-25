package com.test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.test.beans.Order;
import com.test.beans.Product;
import com.test.beans.User;
import com.test.util.DateUtils;

import sun.awt.windows.ThemeReader;

public class ApplicationDao {

	public List<Product> searchProducts(String searchString) throws SQLException {
		List<Product> products = new ArrayList<Product>();
		/** DocPoint 8. Search will return a list of Product beans*/
		Connection connection = DBConnection.getConnectionToDatabase();
		System.out.println("search string in DAO: " + searchString);

		/** DocPoint 9. set the query to search for products using search and a pattern*/
		//from Java.sql
		PreparedStatement statement = connection
				.prepareStatement("select * from products where product_name like '%" + searchString + "%'");
		ResultSet set = statement.executeQuery();
		Product product = null;
		//populate the products object with the result set
		while (set.next()) {
			product = new Product();
			product.setProductId(set.getInt("product_id"));
			product.setProductName(set.getString("product_name"));
			product.setProductImgPath(set.getString("image_path"));
			products.add(product);
		}
		return products;
	}

	/** DocPoint 16. Register the user to the database with the user bean*/
	public int registerUser(User user) throws SQLException {
		Connection connection = DBConnection.getConnectionToDatabase();
		
		/** DocPoint 17. prepare the query to add the values to the users table*/
		String insertUserQuery = "insert into users values(?,?,?,?,?,?)";
		PreparedStatement statement = connection.prepareStatement(insertUserQuery);
		/** DocPoint 18. define the parameters mentioned by the question marks above*/
		statement.setString(1, user.getUsername());
		statement.setString(2, user.getPassword());
		statement.setString(3, user.getFirstName());
		statement.setString(4, user.getLastName());
		statement.setInt(5, user.getAge());
		statement.setString(6, user.getActivity());
		System.out.println(insertUserQuery);

		/** DocPoint 19. rowsAffected shows that you were able to insert
		 * a document into the database and how many rows were affected*/
		int rowsAffected = statement.executeUpdate();
		return rowsAffected;
	}

	public boolean validateUser(String username, String password) {
		Connection connection = DBConnection.getConnectionToDatabase();

		String sqlQuery = "select * from users where username=? and password=?";
		PreparedStatement statement;
		boolean isValidUser = false;
			
		try {
			statement = connection.prepareStatement(sqlQuery);
			statement.setString(1, username);
			statement.setString(2, password);
			ResultSet resultSet = statement.executeQuery();
			if (resultSet.next()) {
				isValidUser = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return isValidUser;
		/* DocPoint 46. query the database to see if the user
		 * that is trying to login is a valid user, and return
		 * if the user if valid*/
		
	}

	public List<Order> getOrdersForUser(String username) {
		List<Order> orders = new ArrayList<>();

		try {
			/* DocPoint 52. Return the order history for a particular
			 * user from the database*/
			Connection connection = DBConnection.getConnectionToDatabase();
			System.out.println("search string in DAO: " + username);
			Order order = null;
			PreparedStatement statement = connection.prepareStatement("select * from orders where user_name=?");
			statement.setString(1, username);
			ResultSet set = statement.executeQuery(); 
			while (set.next()) {
				order = new Order();
				order.setOrderId(set.getInt("order_id"));
				order.setProductName(set.getString("product_name"));
				order.setProductImgPath(set.getString("image_path"));
				order.setOrderDate(DateUtils.formatDate(new Date(set.getDate("order_date").getTime())));
				order.setUsername(set.getString("user_name"));
				orders.add(order);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return orders;

	}

	
	public User getProfileDetails(String username){
		User user = new User();
		try {
			Connection connection = DBConnection.getConnectionToDatabase();
			System.out.println("search string in DAO: " + username);
			PreparedStatement statement = connection.prepareStatement("select * from users where username=?");
			statement.setString(1, username);
			ResultSet set = statement.executeQuery();
			while (set.next()) {
				
				user.setUsername(set.getString("username"));
				user.setFirstName(set.getString("first_name"));
				user.setLastName(set.getString("last_name"));
				user.setActivity(set.getString("activity"));
				user.setAge(set.getInt("age"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		/*
		 * DocPoint 43. This method retrieves the details from the database.
		 * Take the entire row of the result set an put it in the
		 * user object.
		 */
		return user;
	}
}
