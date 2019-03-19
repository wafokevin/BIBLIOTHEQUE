package bibliotheque.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.mysql.jdbc.Connection;

import bibliotheque.bean.BeanException;
import bibliotheque.bean.Utilisateur;


public class UtilisateurDaoImpl implements UtilisateurDao {
	private DaoFactory daoFactory;
	
	UtilisateurDaoImpl(DaoFactory daoFactory){
		this.daoFactory = daoFactory;
	}
		
	
	@Override
	public Utilisateur seConnecter(Utilisateur utilisateur) throws DaoException, BeanException {
		Connection connexion = null;
		Statement statement = null;
		ResultSet  resultat = null;
		Utilisateur util = new Utilisateur();
		try {
			connexion = daoFactory.getConnection();
			statement = connexion.createStatement(); 
			resultat = statement.executeQuery("SELECT * FROM utilisateur WHERE login = '"+utilisateur.getLogin()+"';");
			int i =0;
			while(resultat.next()) {
				util.setLogin(resultat.getString("login"));
				util.setPasse(resultat.getString("passe"));
				util.setGroupe(resultat.getString("groupe")); 
				i = i+1;
			}
			if(i==1) {
				if(utilisateur.getPasse().equals(util.getPasse())) {
					return util;
				}else {
					throw new BeanException("Mot de passe incorrect");
				}
			}else if(i==0){
				throw new BeanException("login incorrect");
			}else {
				throw new BeanException("login redondant dans la bd");
			}
		}catch(SQLException e) { 
			throw new DaoException("Impossible de communiquer avec la BD l1");
		}finally {
			//fermer la connexion
			try {
				if(connexion != null)
					connexion.close();
			}catch(SQLException e) {
				throw new DaoException("Impossible de communiquer avec la BD l2");
		    }
		}

	}

	

	
	//ajouter un utilsateur
	@Override
	public void ajouter(Utilisateur utilisateur) throws DaoException {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connexion = daoFactory.getConnection();
			preparedStatement = connexion.prepareStatement("INSERT INTO utilisateur(login, groupe, passe,premierConnection ) VALUES(?,?,?,?);");
			preparedStatement.setString(1, utilisateur.getLogin());
			preparedStatement.setString(2, utilisateur.getGroupe());  
			preparedStatement.setString(3, "passe");
			preparedStatement.setString(4, "OUI"); 
			
			preparedStatement.executeUpdate();
			//a la fin de tout les enregistrement
			//connexion.commit();
		}catch(SQLException e) {
			try {
				if(connexion != null) {
					connexion.rollback();
				} 
			}catch(SQLException e2) {
			}	
		   throw new DaoException("Impossible de communiquer avec la BD a1");
	}finally {
		try {
			if(connexion != null)
				connexion.close();
		}catch(SQLException e) {
			throw new DaoException("Impossible de communiquer avec la BD a2");
			}
		}
	}
	
	
	
	
	//lister les utilisateur de la bd
	@Override
	public List<Utilisateur> lister() throws DaoException { 
		List<Utilisateur> utilisateurs = new ArrayList<Utilisateur>();
		Connection connexion = null;
		Statement statement = null;
		ResultSet  resultat = null;
		
		try {
			connexion = daoFactory.getConnection();
			statement = connexion.createStatement(); 
			resultat = statement.executeQuery("SELECT login, groupe FROM utilisateur;");
			
			while(resultat.next()) {
				String log = resultat.getString("login");
				String group = resultat.getString("groupe");
				
				Utilisateur utilisateur = new Utilisateur();
				utilisateur.setLogin(log);
				utilisateur.setGroupe(group);
				utilisateurs.add(utilisateur); 
			}
		}catch(SQLException e) { 
			throw new DaoException("Impossible de communiquer avec la BD l1");
		}finally {
			//fermer la connexion
			try {
				if(connexion != null)
					connexion.close();
			}catch(SQLException e) {
				throw new DaoException("Impossible de communiquer avec la BD l2");
		    }
		}

	return utilisateurs;
	}
	
}
