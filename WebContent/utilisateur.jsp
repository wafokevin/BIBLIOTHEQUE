
</head>
<body>
<div id="art-main">
<header class="art-header">


    <div class="art-shapes">

            </div>



<div class="art-textblock art-object227400126" data-left="97.63%">
    <form class="art-search" name="Search" action="javascript:void(0)">
    <input type="text" value="">
    <input type="submit" value="Search" name="search" class="art-search-button">
</form>
</div>
                
                    
</header>
<nav class="art-nav">
    <ul class="art-hmenu"><li><a href="typeLivre.jsp" class="">TYPE LIVRE</a><ul class=""><li><a href="listeType.jsp" class="">Liste type</a></li><li><a href="miseAjourType.jsp" class="">Mise a jour type</a></li></ul></li><li><a href="auteurLivre.jsp" class="">AUTEUR LIVRE</a><ul class=""><li><a href="listeAuteur.jsp" class="">Liste auteurs</a></li><li><a href="miseAjourAuteur.jsp" class="">Mise a jour auteur</a></li></ul></li><li><a href="livres.jsp" class="">LIVRE</a><ul class=""><li><a href="listeLivre.jsp" class="">Liste livre</a></li><li><a href="miseAjourLivre.jsp" class="">Mise ajour livre</a></li><li><a href="editerEtatLivre.jsp" class="">Editer etats</a></li></ul></li><li><a href="adherent.jsp" class="">ADHERENT</a><ul class=""><li><a href="listeAdherent.jsp" class="">Liste adherent</a></li><li><a href="miseAjourAdherent.jsp" class="">Mise a jour adherent</a></li></ul></li><li><a href="pretLivre.jsp" class="">PRET DE LIVRE</a><ul class=""><li><a href="listePret.jsp" class="">Liste des prets</a></li><li><a href="miseAjourPret.jsp" class="">Mise a jour pret</a></li><li><a href="editerEtatPretLivre.jsp" class="">Editer etats</a></li></ul></li><li><a href="retourLivre.jsp" class="">RETOUR DE LIVRE</a><ul class=""><li><a href="listeRetour.jsp" class="">Liste des retours</a></li><li><a href="signalerRetour.jsp" class="">Signaler un retour</a></li><li><a href="editerEtatRetour.jsp" class="">Editer etats</a></li></ul></li><li><a href="ServletUtilisateur" class="active">UTILISATEUR</a></li></ul> 
    </nav>
<div class="art-sheet clearfix">
            <div class="art-layout-wrapper">
                <div class="art-content-layout">
                    <div class="art-content-layout-row">
                        <div class="art-layout-cell art-sidebar1"><div class="art-block clearfix">
        <div class="art-blockheader">
            <h3 class="t">En ligne</h3>
        </div>
        <div class="art-blockcontent">
        <p>Utilisateur: <c:out value="${login}" /> </p>
        <p>Groupe: <c:out value="${groupe}" /> </p>
        </div>
</div><div class="art-vmenublock clearfix">
        <div class="art-vmenublockheader">
            <h3 class="t">MENU</h3>
        </div>
        <div class="art-vmenublockcontent">
			<ul class="art-vmenu"><li><a href="typeLivre.jsp" class="">TYPE LIVRE</a><ul class=""><li><a href="listeType.jsp" class="">Liste type</a></li><li><a href="miseAjourType.jsp" class="">Mise a jour type</a></li></ul></li><li><a href="auteurLivre.jsp" class="">AUTEUR LIVRE</a><ul class=""><li><a href="listeAuteur.jsp" class="">Liste auteurs</a></li><li><a href="miseAjourAuteur.jsp" class="">Mise a jour auteur</a></li></ul></li><li><a href="livres.jsp" class="">LIVRE</a><ul class=""><li><a href="listeLivre.jsp" class="">Liste livre</a></li><li><a href="miseAjourLivre.jsp" class="">Mise ajour livre</a></li><li><a href="editerEtatLivre.jsp" class="">Editer etats</a></li></ul></li><li><a href="adherent.jsp" class="">ADHERENT</a><ul class=""><li><a href="listeAdherent.jsp" class="">Liste adherent</a></li><li><a href="miseAjourAdherent.jsp" class="">Mise a jour adherent</a></li></ul></li><li><a href="pretLivre.jsp" class="">PRET DE LIVRE</a><ul class=""><li><a href="listePret.jsp" class="">Liste des prets</a></li><li><a href="miseAjourPret.jsp" class="">Mise a jour pret</a></li><li><a href="editerEtatPretLivre.jsp" class="">Editer etats</a></li></ul></li><li><a href="retourLivre.jsp" class="">RETOUR DE LIVRE</a><ul class=""><li><a href="listeRetour.jsp" class="">Liste des retours</a></li><li><a href="signalerRetour.jsp" class="">Signaler un retour</a></li><li><a href="editerEtatRetour.jsp" class="">Editer etats</a></li></ul></li><li><a href="ServletUtilisateur" class="active">UTILISATEUR</a></li></ul>                
        </div>
</div></div>
      <div class="art-layout-cell art-content">
      	<article class="art-post art-article">
                                     
      		 <div class="art-postcontent art-postcontent-0 clearfix">
      			<p class="tt">liste des utilisateurs</p>
 				<table class="fixed_header" id="table">
		 					 <thead>
		  					  <tr>
							    <th>LOGIN</th>
							    <th>GROUPE</th>
							    <th>ETAT</th>
		 				     </tr>
						  </thead>
						  <tbody>
						  	   <c:forEach var="utilisateur" items="${utilisateurs}">
						  	  	<tr> 
									<td><c:out value="${utilisateur.login}"/></td>
									<td><c:out value="${utilisateur.groupe}"/></td>
									<td>oui</td>
								</tr>
								</c:forEach>
		 				 </tbody>
					   </table>
      			       <div class="formul">                    	
	      					<h3 class="ta">Gestion utilisateur </h3>	      					  
								  <form action="ServletUtilisateur" method="post">
								  	<fieldset class="form-ajout-util">
								  		<legend>Formulaire d'ajout des utilisateurs</legend>
								  		<label class="form-text">Login : <input type="text" name="login" style="width:80%; font-size: 13px; font-weight:bold;padding-left:8px;color:#000000"> </label>								  		
								  		<label for="style-select" class="selec-droit">
								  		<select name="groupeUtil" id="style-select">
								  			<option value="">Choisir le role</option>
								  			<option value="ADMIN">ADMIN</option>
								  			<option value="USER">USER</option>
								  		</select>	
								  		</label>											  		 			    							    
								        <div class="form-ajout-btt"><input type="submit" value="Ajouter"><c:out value="${erreur }"/></div>
								  	</fieldset>								   
								  </form>     
								  
								  
								  <form action="ServletIndex" method="post">
								  	<fieldset class="form-ajout-util" style="margin-top:10px">
								  		<legend>Formulaire de modification des utilisateurs</legend>
								  		<label class="form-text">Login : <input type="text" name="loginModif" style="width:80%; font-size: 13px; font-weight:bold;padding-left:8px;color:#000000"> </label>								  		
								  		<label for="style-select" class="selec-droit">
								  		<select name="groupeUtilModif" id="style-select">
								  			<option value="">Changer le role</option>
								  			<option value="ADMIN">ADMIN</option>
								  			<option value="USER">USER</option>
								  		</select>	
								  		</label>											  		 			    							    
								        <div class="form-ajout-btt"><input type="submit" value="Modifier"></div>
								  	</fieldset>								   
								  </form> 								  
								                 
	                   </div>
      		  </div>

		</article>
	  </div>
                    </div>
                </div>
            </div>
            <footer class="art-footer">
<p>&nbsp;&nbsp;<a href="" class="art-facebook-tag-icon" style="line-height: 32px;"></a>&nbsp;&nbsp;<a href="" class="art-twitter-tag-icon" style="line-height: 32px;"></a>&nbsp;&nbsp;<a href="" class="art-rss-tag-icon" style="line-height: 25px;"></a>&nbsp;&nbsp;Université TIME</p>
<p>Gestion de bibliotheque © 2019. Rahime &amp; kevin.</p>
</footer>

    </div>
    <p class="art-page-footer">
        <span id="art-footnote-links"><a href="http://www.artisteer.com/" target="_blank">Web Template</a> created with Artisteer.</span>
    </p>
</div>


</body></html>