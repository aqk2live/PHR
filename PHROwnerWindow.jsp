

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.DBConnect"%>
<%@page import="com.PHROwnerSignInServ"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <%request.getSession().setAttribute("username",PHROwnerSignInServ.username);%>
    <head>
<title>Patient Window</title>
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
  
  
  
</head>
    
 
<body>
    
  <%
//request.getSession().setAttribute(name, value);
  %>
  
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo"> <img src="images/logo_img.jpg" alt="" width="51" height="48" />
          <h2 style="width: 1000px;"><a href="#"><span style="color: #0d2c52;font-size: larger">Scalable and Secure Sharing of Personal Health Records in  </span><span style="font-size: larger">Cloud Computing using Attribute-based Encryption</span></a></h2>
      </div>
      <div class="clr"></div>
      <div class="menu_nav">
        <ul>
          <li><a href="#">Home</a></li>
          <li><a href="PHRDocumentUpload.jsp">Upload Documents</a></li>
          <li><a href="PHRShareDocument.jsp">Share Document</a></li>
          <li><a href="LogoutServ">Logout <%=session.getAttribute("username")%></a></li>
        </ul>
        <div class="search">
          <form id="form" name="form" method="post" action="#">
            <span>
            <input name="q" type="text" class="keywords" id="textfield" maxlength="30" value="Search..." />
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
          <h1><span>Welcome </span> <%=session.getAttribute("username")%></h1>
          <div class="clr"></div>
          <p><strong>This page contains all your medical documents that you have uploaded , Medical documents such as Health records , medical reports , Test case documents , Treatment files , receipts ...etc </strong></p>
          <p><strong> This application provides full protection to your documents and ensures that nobody can steal or tamper your medical information .</strong></p> 
          <h2>Your Documents</h2><br/><br/>          
          <% 
          
            DBConnect dbc = new DBConnect();
            
            Statement st = dbc.dbCon();
            
            String sql = "select * from phrownerdocs where patientid='"+PHROwnerSignInServ.patient_id+"' ;";
          
             ResultSet rs = st.executeQuery(sql);
          %>
          
          <table style="width:100%">
              
      <tr>
          <td><h4>S.no </h4> </td>
          <td><h4>Documents </h4></</td>    
  </tr>
  <%int i=1; while(rs.next()){   %>   
  <tr>
     
      <td><%=i%></td>
      <td><%=rs.getString("doc_name")%></td>    
  </tr>
  <% i++;  }%>
  
  <tr>
      <td><br/> </td>
      <td> <br/> </td>
  </tr>
  
  <tr>
      <td>  </td>
      <td>  </td>
  </tr>
  
  <tr>
      <td>  </td>
      <td>  </td>
  </tr>
  
  <tr>
      <td>  </td>
      <td>  </td>
  </tr>
  
  <tr>
      <td><h3 style=" color: red">Download Documents </h3></td>
      <td><a href="PHROwnerDownloadDocuments.jsp">
  <img src="images/Animated-Download-Button.gif" alt="Click here to download Documents" style="  width: 300px; height: 150px; border: 0">
            </a></td>
  </tr>
          </table><br/><br/>
          
          
  
        </div>
       
      </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star">Menu</h2>
          <div class="clr"></div>
          <ul class="sb_menu">
            <li><a href="PHROwnerInbox.jsp">Inbox</a></li>
            <li><a href="DeleteDoc.jsp">Delete Document</a></li>
          </ul>
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