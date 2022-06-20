<%-- 
    Document   : OrgSignup
    Created on : 7-Oct-2014, 11:58:56 AM
    Author     : Abdulquader
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>SignUp | Organization</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
  
<link href="login-box.css" rel="stylesheet" type="text/css" />
  
  
  
</head>
    
 
<body>
 
  
  
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo"> <img src="images/logo_img.jpg" alt="" width="51" height="48" />
          <h2 style="width: 1000px;"><a href="#"><span style="color: #0d2c52;font-size: larger">Scalable and Secure Sharing of Personal Health Records in  </span><span style="font-size: larger">Cloud Computing using Attribute-based Encryption</span></a></h2>
      </div>
      <div class="clr"></div>
      <div class="menu_nav">
        <ul>
          <li><a href="index.jsp">Home</a></li>
          <li><a href="OrgSignup.jsp">Sign Up</a></li>
        </ul>
        <div class="search">
          
        </div>
      </div>
      <div class="clr"></div>
      <div class="header_img"> <img src="images/jpimage_1.jpg" alt="" width="960" height="326" /></div>
    </div>
  </div>
  <div class="clr"></div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <div class="clr"></div>
          
          
          
              <h3>Organization Sign up</h3><br/>
  <form  action="OrgSignupServ" method="post">
  <table style="width:100%">
      
      <tr>
    <td>Organization ID :  </td>
    <td><input readonly type="text" name="orgid" value="<%=comex.AutoGenOrgId.autoGenId()%>"/></td>    
  </tr>    
      
      <tr>
    <td>Organization Name :  </td>
    <td><input type="text" name="orgname" value=""/></td>    
  </tr>    
      
       <tr>
    <td>Type of Organization :  </td>
    <td><select name="TypeofOrg">
  <option value="Select any one">Select any one</option>
  <option value="Hospital">Hospital</option>
  <option value="Insurance company">Insurance company</option>
  <option value="Healthcare">Health Care</option>
  <option value="Government Agency">Government Agency</option>
  <option value="others">others</option>
</select></td>    
  </tr>
      <tr>
    <td>User Name :  </td>
    <td><input type="text" name="username"/></td>    
  </tr>
      <tr>
    <td>Password :  </td>
    <td><input type="password" name="password"/></td>    
  </tr>
  <tr>
    <td>Website :  </td>
    <td><input type="text" name="website"/></td>    
  </tr>
  <tr>
    <td>Email ID :  </td>
    <td><input type="text" name="email"/></td>    
  </tr>     
      <tr>
    <td>Contact number :  </td>
    <td><input type="text" name="cno"/></td>    
  </tr>       
     
      
      <tr>
    <td>Address :  </td>
    <td><textarea rows="4" cols="50" name="address"></textarea></td>    
  </tr>
      <tr>
    <td> </td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Enter"/></td>    
  </tr>
      
</table>
  </form>    
          
        </div>
       
      </div>
     
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg">
   
    <div class="footer">
        <p  class="lf">Get More  from <a target="_blank" href="">SIMPLE IT LABS</a></p>
      <div class="clr"></div>
    </div>
  </div>
</div>
</body>
</html>
