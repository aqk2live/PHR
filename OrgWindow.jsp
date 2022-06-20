<%-- 
    Document   : OrgWindow
    Created on : 10-Oct-2014, 11:53:41 AM
    Author     : Abdulquader
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.DBConnect"%>
<%@page import="com.OrgSignInServ"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <%request.getSession().setAttribute("username",OrgSignInServ.username);%>
    <head>
<title>Organization Window</title>
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
    
    <%! ResultSet rs,rs1;
        Statement st,st1;
    %>
 
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
          <li><a href="OrgDocumentUpload.jsp">Upload Documents</a></li>
          <li><a href="LogoutServ">Logout <%=OrgSignInServ.username%></a></li>
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
          <h1><span>Welcome </span> <%=OrgSignInServ.username%></h1>
          
          <% 
          
            DBConnect dbc = new DBConnect();
            
            st = dbc.dbCon();
            
            String sql = "select * from sharedocs where sharedto='"+OrgSignInServ.username+"' ;";
          
             rs = st.executeQuery(sql);
             
             
               st1 = dbc.dbCon();
            
            String sql1 = "select * from orgdocs where orgid='"+OrgSignInServ.orgid+"' ;";
          
             rs1 = st1.executeQuery(sql1);
          %>
          
          <div class="clr"></div>
          <p><strong>In this section Organization can have their own documents , policies , medical treatment files , Introduction ...etc . These files will be kept secure so that no body other than Organization can view it . Organization can send its documents to users whenever it intends to do so. </strong></p>
          
          <h2 style=" color:  #00ffff">Received Documents</h2> 
          <p><strong>This section contains documents your organization receive from PHROwners</strong></p><br/><br/>
          
          
          <table style="width:100%">
              
      <tr>
          <td><h4>S.no </h4> </td>
          <td><h4>Documents </h4></</td>    
          <td><h4>Message</h4></td>
          <td><h4>Sender</h4></td>
          <td><h4>Date & Time</h4></td>
  </tr>
  <%int i=1; while(rs.next()){  String doc_name=rs.getString("doc_name");  String sender=rs.getString("sender");
  String org=(String)session.getAttribute("username");
  %>   
  <tr>
     
      <td><%=i%></td>
      <td><a href="OrgDocDownServ?docnm=<%=sender+doc_name%>" target="_blank"><%=doc_name%></a></td>   
      <td><%=rs.getString("msg")%></td>
      <td><%=sender%></td>
      <td><%=rs.getString("dat")%></td>
      <td><a href="ReplyPHROwner.jsp?rcvr=<%=sender%>&snd=<%=org%>"><b>Reply</b></a></td>
  </tr>
  <% i++;  }%>
  
  <tr>
      <td><br/> </td>
      <td> <br/> </td>
  </tr>
          </table> <br/><br/>
          
          <h2 style=" color:  #00ffff">Uploaded Documents</h2> 
          <p><strong>This section contains your organization's uploaded documents</strong></p><br/><br/>
          
          <table style="width:100%">
              
      <tr>
          <td><h4>S.no </h4> </td>
          <td><h4>Document </h4></</td>    
          
  </tr>
          
  <%int i1=1; while(rs1.next()){ %>
  <tr>
      <td><%=i1%></td>
      <td><a href="OrgDocDownServ?docnm=<%=rs1.getString("doc_id")%>" target="_blank"><%=rs1.getString("doc_name")%></a></td>
      
      
  </tr>
<% i1++; }

   rs.close();
   rs1.close();
   st.close();
   st1.close();
%>

          </table>
          
        </div>
       
      </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star">Menu</h2>
          <div class="clr"></div>
          <ul class="sb_menu">
            <li><a href="#">Home</a></li>
            <li><a href="Help.jsp">Help</a></li>
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
