<!-- #include file="adovbs.inc" -->
<% 
	' tomo la pagina de destino en caso de que sea validado el suscriptor
	pagina= request.form("pagina")
	
	' Abro la conexion a la base de suscriptores
   	dim conn
   	Set conn = Server.CreateObject("ADODB.Connection")
  	conn.open "omicr3.ospymes","",""
 	
 	' verifico si es un usuario premium
 	sql = "SELECT * FROM premium where usuario='" & request.form("usuario") & "'"
	Set rs = Server.CreateObject("ADODB.Recordset")
	rs.CursorType = adOpenKeyset
	rs.LockType = adLockOptimistic
	rs.ActiveConnection = conn
	rs.Source = sql
	rs.Open 
   	if not rs.bof then ' Existe el suscriptor'
		if rs.fields("password").value=request.form("password") then 
		' Es suscriptor premium
			session("usuariopremium")= request.form("usuario")
			' Lo redirecciono a la pagina que solicito
			
		else
		' Es suscriptor pero escribio una contraseña equivocada
		end if
	else
	end if
	rs.close
	
	
	' Verifico si es un suscriptor gratuito
	
 	sql = "SELECT * FROM results where usuario='" & request.form("usuario") & "'"
	Set rs = Server.CreateObject("ADODB.Recordset")
	rs.CursorType = adOpenKeyset
	rs.LockType = adLockOptimistic
	rs.ActiveConnection = conn
	rs.Source = sql
	rs.Open 

	
	if not rs.bof then ' Existe el alumno'
		if rs.fields("password").value=request.form("password") then 'alumno validado
			'Creo la session de usuario gratuito y lo redirecciono a la pagina que solicito
			session("usuario")= request.form("usuario")
			response.redirect pagina
		else
		end if
	else
	end if
	rs.close
	conn.close
	%>	

<html>
<head>
<meta http-equiv="Content-Language" content="es-ar">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Registración de usuarios</title>
</head>
<body topmargin="0" leftmargin="0" link="#FF0033" vlink="#000080" bgcolor="#336699" text="#FFFFFF">
<table cellspacing="0" cellpadding="0" border="0" align="center">
  <tr>
    <td width="110" height="3" valign="top"></td>
    <td width="200" height="3" valign="top"></td>
    <td width="145" height="3" valign="top"></td>
  </tr>
  <tr>
    <td width="110" height="200" valign="top"></td>
    <td width="200" height="200" valign="top"><img src="logocfinal.gif" width="200" height="192"></td>
    <td width="145" height="200" valign="top"></td>
  </tr>
  <tr>
    <td width="455" height="32" colspan="3" valign="top"><font face="Arial"> <font face="Verdana, Arial, Helvetica, sans-serif"><b><font size="2">Para 
      ingresar a los servicios exclusivos para suscriptores debe ser un usuario 
      registrado. Para registrarse haga <a href="registrarse.htm">clic aqui</a></font></b></font></font></td>
  </tr>
  <tr>
    <td width="110" height="1" valign="top"><img width="110" height="1" src="transparent.gif"></td>
    <td width="200" height="1" valign="top"><img width="200" height="1" src="transparent.gif"></td>
    <td width="145" height="1" valign="top"><img width="145" height="1" src="transparent.gif"></td>
  </tr>
</table>
</body>
</html>
