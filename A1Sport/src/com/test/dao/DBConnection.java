package com.test.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	public static Connection getConnectionToDatabase() {
		Connection connection = null;
		/** DocPoint 4.Gets the connection object */
		try {

			// load the driver class into memory
			/** DocPoint 5.Driver class is part of the jar file in WEB-INF/lib/mysql-connector-java-5.1.49-bin */
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("MySQL JDBC Driver Registered!");

			// get hold of the DriverManager
			/** DocPoint 6. consult to driver manager to call the getConnection API 
			 * from the java.SQL package. Hplus is the schema name and root,root are the
			 * user and password defaults that were also manually set*/
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/a1sport", "root", "root");
		} catch (ClassNotFoundException e) {
			System.out.println("Where is your MySQL JDBC Driver?");
			e.printStackTrace();

		}

		catch (SQLException e) {
			System.out.println("Connection Failed! Check output console");
			e.printStackTrace();

		}

		if (connection != null) {
			System.out.println("Connection made to DB!");
		}
		return connection;
		/** DocPoint 7. establish connection to the database and return the
		 * object connection*/
	}

}
