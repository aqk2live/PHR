<%-- 
    Document   : DeleteDoc
    Created on : 25-Oct-2014, 4:40:37 PM
    Author     : Abdulquader
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.PHROwnerSignInServ"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.DBConnect"%>
<%@page import="com.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Document | Delete</title>
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
          <li><a href="PHRDocumentUpload.jsp">Upload Documents</a></li>
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
          
          <% 
          
            DBConnect dbc = new DBConnect();
            
            Statement st = dbc.dbCon();
            
            String sql = "select * from phrownerdocs where patientid='"+PHROwnerSignInServ.patient_id+"' ;";
          
             ResultSet rs = st.executeQuery(sql);
          %>
          
          <h2 style=" color: #00ffff">Document delete section</h2><br/><br/>
          <form action="PHROwnerDeleteDocServ" target="_blank">
          <table style="width:100%">
             
      <tr>
   
          <td style=" width: 200px"><select name="dd">
  <option value="Select Document">Select Document</option>
  
  <% while(rs.next()) {%>
  <option value="<%=rs.getString("doc_name")%>"><%=rs.getString("doc_name")%></option>
  <% }%>
</select></td>    
  

              
<td><input id="enter" name="d1" type="image"  
      value="delete"
       src="images/trash.gif"/> </td>
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
