package bibliotheque.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bibliotheque.bean.BeanException;
import bibliotheque.bean.Utilisateur;
import bibliotheque.dao.DaoException;
import bibliotheque.dao.DaoFactory;
import bibliotheque.dao.UtilisateurDao;



@WebServlet("/ServletIndex")
public class ServletIndex extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UtilisateurDao utilisateurDao;
	
	public void init() throws ServletException{
		DaoFactory daoFactory = DaoFactory.getInstance();
		this.utilisateurDao = daoFactory.getUtilisateurDao(); 
		}
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Utilisateur utilisateur = new Utilisateur(); 

		utilisateur.setLogin(request.getParameter("login"));
		utilisateur.setPasse(request.getParameter("passe")); 
		
		try {
			
			request.setAttribute("utilisateur", utilisateurDao.seConnecter(utilisateur)); 
		} catch (DaoException | BeanException e) {
			request.setAttribute("erreur", e.getMessage());
			this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
		}  
		this.getServletContext().getRequestDispatcher("/typeLivre.jsp").forward(request, response);
		
	}

}
