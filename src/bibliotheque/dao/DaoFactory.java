package bibliotheque.dao;

import java.sql.DriverManager;
import java.sql.SQLException;
import com.mysql.jdbc.Connection;

public class DaoFactory {
	private String url;
	private String username;
	private String password;
	
	DaoFactory(String url,String username,String password){
		this.url = url;
		this.username = username;
		this.password = password;
	}
	
	public static DaoFactory getInstance() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e){
	
		}
		
		DaoFactory instance = new DaoFactory("jdbc:mysql://localhost:3306/bibliotheque","root","");
		return instance;
	}
	
	public Connection getConnection() throws SQLException{
		return (Connection) DriverManager.getConnection(url, username, password);
	} 
	
	//recuperation du Dao si on a plusieur table on devais fait d'autre methode comme sa comme par exemple getMessageDao
	public UtilisateurDao getUtilisateurDao() {
		return new UtilisateurDaoImpl(this); 
	}
}

