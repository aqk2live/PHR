<%-- 
    Document   : PHRDocumentUpload
    Created on : 10-Oct-2014, 10:51:58 AM
    Author     : Abdulquader
--%>

<%@page import="com.PHROwnerSignInServ"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Document upload</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<script type="text/javascript" src="js/radius.js"></script>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css" />
  
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
          <li><a href="PHROwnerWindow.jsp">Home</a></li>
          <li><a href="PHRShareDocument.jsp">Share Document</a></li>
          <li><a href="LogoutServ">Logout <%=session.getAttribute("username")%></a></li>
        </ul>
        <div class="search">
          <form id="form" name="form" method="post" action="#">
            <span>
            <input name="q" type="text" class="keywords" id="textfield" maxlength="50" value="Search..." />
            <input name="b" type="image" src="images/search.gif" class="button" />
            </span>
          </form>
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
          
          
         <h3>Upload  documents </h3><br/><br/>
    <form action="UploadFile" method="post" enctype="multipart/form-data">
    <table style="width:100%">
  
  <tr>
    <td>Choose document : </td>
    <td><input type="file" name="filetoupload"></td>   
  </tr>
        <tr>
    <td>        </td>
    <td>        </td>   
  </tr>
        <tr>
    <td>Description : (upto 255 characters) </td>
    <td><textarea rows="4" cols="50" name="descs" >
 
</textarea></td>   
  </tr>
        <tr>
    <td>        </td>
    <td>        </td>   
  </tr> 
        <tr>
    <td>        </td>
    <td>        </td>   
  </tr> 
        <tr>
    <td>        </td>
    <td>        </td>   
  </tr> 
        <tr>
    <td>        </td>
    <td><input type="submit" value="Upload File" /></td>   
  </tr>
        
    </table><br/>
    
     <br/>

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
