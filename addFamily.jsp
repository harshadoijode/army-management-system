<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="Style_button_text.css" type="text/css" />
<title>Untitled Document</title>
<style type="text/css">
<!--
.style1 {
	color: #FFFF00;
	font-weight: bold;
}
body,td,th {
	color: #FFFF00;
	font-family: Georgia, Times New Roman, Times, serif;
	font-weight: bold;
}
body {
	background-color: #0033FF;
	background-image:url(images/bg.jpg)
}
.style2 {color: #000000}
-->
</style>




</head>

<body>
 <%@ include file="adminmenu.html" %>
<p>
 
  <%@ include file="db.jsp" %>
  <a href="AdminLogin.html" target="_parent">
<input type="button" value="Back" /></a>
</p>
<p align="center" class="style1">Add Family </p>
<div style="margin-left:30%; margin-right:30%; background-color:#999999; border-radius:20px;">
<form id="form1" name="form1" method="post" action="">
  <p>&nbsp;</p>
  <table width="auto" border="0" align="center">
   <tr>
      <td ><span class="style2">Service No </span></td>
      <td ><select name="of1">
	  <% 
	  rst=stmt.executeQuery("select * from personnel");
	  while(rst.next()){
	   %>
        <option><%= rst.getString(1) %></option>
		<% } %>
      </select>
      </td>
    </tr>
	 <tr>
      <td ><span class="style2">Department name </span></td>
      <td ><input name="of2" type="text" id="of2" required/>      </td>
    </tr>
    <tr>
      <td ><span class="style2">Date of Birth </span></td>
      <td ><input name="of3" type="date" id="of3" required />      </td>
    </tr>
	
    
   
    <tr>
      <td><span class="style2">Gender </span></td>
      <td><p>
        <label>
          <input type="radio" name="of4" value="Male" checked="checked" />
          Male</label>
        <br />
        <label>
          <input type="radio" name="of4" value="Female" />
          Female</label>
        <br />
      </p></td>
    </tr>
	<tr>
      <td><span class="style2">Relation </span></td>
      <td><select name="of5">
	  <option>Son</option>
	  <option>Daughtor</option>
	  <option>wife</option>
	   <option>father</option>
	    <option>mother</option>
		 <option>aunty</option>
		  <option>uncle</option>
		   
	  </select></td>
    </tr>
    <tr>
      <td><span class="style2">Address</span></td>
      <td><textarea name="of6"></textarea></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="Submit" onclick="return validate()" />
        <input type="reset" name="Submit2" value="Reset" /></td>
    </tr>
  </table>
  <p>&nbsp;</p>
</form>
</div>
<% 
if(request.getParameter("Submit")!=null){

int x=stmt.executeUpdate("insert into family(SERV_NUMBER,DEP_NAME,DOB,Gender,Relationship,Address) values('"+request.getParameter("of1")+"','"+request.getParameter("of2")+"','"+request.getParameter("of3")+"','"+request.getParameter("of4")+"','"+request.getParameter("of5")+"','"+request.getParameter("of6")+"')");


if(x!=0){
%>
<script> alert("Family added successfully");</script>
<%
}else{
%>
<script> alert("fail to add family");</script>
<%
}
}




 %>
</body>
</html>
