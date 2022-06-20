<%-- 
    Document   : ReplyPHROwner
    Created on : 25-Oct-2014, 10:55:18 PM
    Author     : Abdulquader
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.DBConnect"%>
<%@page import="com.OrgSignInServ"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Reply | PHROwner</title>
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
          <li><a href="OrgWindow.jsp">Home</a></li>
          <li><a href="LogoutServ">Logout <%=OrgSignInServ.username%></a></li>
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
         
          <% String rcvr=request.getParameter("rcvr");%>
          
          <% 
          
            DBConnect dbc = new DBConnect();
            
            Statement st = dbc.dbCon();
            
            String sql = "select * from orgdocs where orgid='"+OrgSignInServ.orgid+"' ;";
          
             ResultSet rs = st.executeQuery(sql);
          %>
          
          <h2 style=" color:  #00ffff">Send Response to <%=rcvr%></h2><br/><br/>
          
          <form action="ReplyPHROwnerServ" method="post">
          <table style="width:100%">
              <input type="hidden" name="rcv" value=<%=rcvr%>>
              <tr>
                  <td><h4>Subject :</h4></td>
                  <td><input type="text" name="subj"></td>
                  
              </tr>
              <tr>
                  <td><h4>Message :</h4></td>
                  <td><textarea rows="4" cols="50" name="msg" >
 
</textarea></td>
                  
                  
              </tr>
              
              
              <tr>
                  <td><h4>Attach File :</h4></td>
                  <td style=" width: 200px"><select name="dd">
  <option value="Select Document">Select Document</option>
  <% while(rs.next()){%>
                  <option value="<%=rs.getString("doc_name")%>"><%=rs.getString("doc_name")%></option>
  <% }%>
</select></td>  
              </tr>
              
          </table><br/><br/>
          <input type="submit" value="Send Reply">
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
