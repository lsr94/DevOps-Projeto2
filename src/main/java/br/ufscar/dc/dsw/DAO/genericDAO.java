package br.ufscar.dc.dsw.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

abstract public class genericDAO {
    
    public genericDAO() {
        try {
            
        	/* Setup Banco de dados Derby */
        	
        	// Class.forName("org.apache.derby.jdbc.ClientDriver");
            
        	/* Setup Banco de dados MySQL */
        	
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    protected Connection getConnection() throws SQLException {
    	
    	/* Conexão banco de dados Derby */
    	
    	// return DriverManager.getConnection("jdbc:derby://localhost:1527/Livraria", "root", "root");
    	
    	/* Conexão banco de dados MySQL */

        String host     = System.getenv().getOrDefault("MYSQL_HOST", "localhost");
        String user     = System.getenv().getOrDefault("MYSQL_USER", "root");
        String password = System.getenv().getOrDefault("MYSQL_ROOT_PASSWORD", "root");

        return DriverManager.getConnection("jdbc:mysql://" + host + ":3306/Livraria", user, password);
    }
}