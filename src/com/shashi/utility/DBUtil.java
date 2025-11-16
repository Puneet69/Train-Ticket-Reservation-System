package com.shashi.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.shashi.beans.TrainException;
import com.shashi.constant.ResponseCode;

public class DBUtil {
	private static Connection con;

	static {
		// Read environment variables with fallback to default values
		String dbHost = System.getenv("DB_HOST");
		if (dbHost == null || dbHost.isEmpty()) {
			dbHost = "db.adozsmkdxblihnaoodiu.supabase.co";
		}
		
		String dbPort = System.getenv("DB_PORT");
		if (dbPort == null || dbPort.isEmpty()) {
			dbPort = "5432";
		}
		
		String dbName = System.getenv("DB_NAME");
		if (dbName == null || dbName.isEmpty()) {
			dbName = "postgres";
		}
		
		String username = System.getenv("DB_USERNAME");
		if (username == null || username.isEmpty()) {
			username = "postgres";
		}
		
		String password = System.getenv("DB_PASSWORD");
		if (password == null || password.isEmpty()) {
			password = "Train@Reservation01";
		}
		
		String driverName = "org.postgresql.Driver";
		String connectionString = "jdbc:postgresql://" + dbHost + ":" + dbPort + "/" + dbName + "?sslmode=require";

		try {
			Class.forName(driverName);
		} catch (ClassNotFoundException e) {
			System.err.println("PostgreSQL Driver not found!");
			e.printStackTrace();
		}

		try {
			System.out.println("Connecting to: " + connectionString);
			System.out.println("Username: " + username);
			con = DriverManager.getConnection(connectionString, username, password);
			System.out.println("Connection Success!!");
		} catch (SQLException e) {
			System.err.println("Failed to connect to database!");
			e.printStackTrace();
		}
	}

	public static Connection getConnection() throws TrainException {
		if (con == null)
			throw new TrainException(ResponseCode.DATABASE_CONNECTION_FAILURE);
		return con;
	}
}
