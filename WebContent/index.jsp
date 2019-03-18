<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<link rel="stylesheet" type="text/css" href="index.css"/>
<title>Test</title>
</head>
<body> 
	<div id="div-main">
		<div class="class-main">

			<div class="content">
				<div class="connection">
				  <form action="ServletIndex" method="post">
					<div class='login'> 
					  <h2>Se connecter</h2>
					  <c:if test="${!empty erreur }">
						<p style="color:yellow;"><c:out value="${erreur }"/></p>
					  </c:if>
					  <input name='login' placeholder='Login' type='text'/>
					  <input id='pw' name='passe' placeholder='Password' type='password'/>
					  <div class='remember'>
					    <input checked='checked' id='remember' name='remember' type='checkbox'/>
					    <label for='remember'></label>se souvenir de mot de passe
					  </div>
					  <input type='submit' value='se connecter'/> 
					  <a class='forgot' href='#'>Mot de passe oublié?</a>  
					</div>			
				  </form>
				</div>
			</div>
				
	
		</div>
	</div>
	
	
	
	
	
<script type="text/javascript">

//show password
$(document).ready(function(){
  $("#pw").focus(function(){
      this.type = "text";
  }).blur(function(){
      this.type = "password";
  })   
});

//Placeholder fixed for Internet Explorer
$(function() {
  var input = document.createElement("input");
  if(('placeholder' in input)==false) { 
      $('[placeholder]').focus(function() {
          var i = $(this);
          if(i.val() == i.attr('placeholder')) {
              i.val('').removeClass('placeholder');
              if(i.hasClass('password')) {
                  i.removeClass('password');
                  this.type='password';
              }           
          }
      }).blur(function() {
          var i = $(this);    
          if(i.val() == '' || i.val() == i.attr('placeholder')) {
              if(this.type=='password') {
                  i.addClass('password');
                  this.type='text';
              }
              i.addClass('placeholder').val(i.attr('placeholder'));
          }
      }).blur().parents('form').submit(function() {
          $(this).find('[placeholder]').each(function() {
              var i = $(this);
              if(i.val() == i.attr('placeholder'))
                  i.val('');
          })
      });
  }
  });


</script>

</body>
</html>