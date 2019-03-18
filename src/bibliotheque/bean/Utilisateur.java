package bibliotheque.bean;

public class Utilisateur {
	private String nom;
	private String prenom;
	private String login;
	private String passe;
	private String groupe;
	
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getPasse() {
		return passe;
	}
	public void setPasse(String passe) {
		this.passe = passe;
	}
	public String getNom() {
		return nom;
	}
	public String getGroupe() {
		return groupe;
	}
	public void setGroupe(String groupe) {
		this.groupe = groupe;
	}
	public void setNom(String nom) throws BeanException {
		
		if(nom.length() > 10) {
			throw new BeanException("Le nom ne doit pas depasser 10 caractere !!");
		}else {
			this.nom = nom;
		}
		
	}
		
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	
	
}
