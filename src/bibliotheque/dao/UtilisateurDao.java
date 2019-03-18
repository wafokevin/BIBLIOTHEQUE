package bibliotheque.dao;
import java.util.List;

import bibliotheque.bean.BeanException;
import bibliotheque.bean.Utilisateur;


public interface UtilisateurDao {
	//si il ya d'autre methodes on ajoute ici mais on ne les defini pas cest dans l'implementation qu'on definis
	Utilisateur seConnecter(Utilisateur utilisateur) throws DaoException, BeanException;
	void ajouter(Utilisateur utilisateur) throws DaoException;
	List<Utilisateur> lister() throws DaoException;  
}
