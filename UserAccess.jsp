<%-- 
    Document   : UserAccess
    Created on : 26-Oct-2014, 2:20:12 AM
    Author     : Abdulquader
--%>

<%@page import="com.UserAccessServ"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>User Access | Window</title>
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
          <li><a href="index.jsp">Home</a></li>
          <li><a href="Help.jsp">Help</a></li>
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
          
          <form action="UserAccessServ" method="post">
         <h2 style=" color:  #00ffff">Enter Encrypted key to access Document</h2>
         <table style="width:100%" >
             
             <tr>
                 <td><h4>Encrypted key :</h4></td>
                 <td><input type="text" name="enckey" style=" color:  #ff0000" ></td>
                                 
             </tr>
             <tr>
                 <td><h4>Email :</h4></td>
                 <td><input type="text" name="email" ></td>
                 
                 
             </tr>
             
                 
                
                 
                 
             
             
         </table><br/>
         
         <center><input type="submit" value="ENTER" ></center><br/>
             
         </form>
          
          <table style="width:100%" border="1" >
              
              <tr>
                  <td style='text-align:center;vertical-align:middle'><h4>Sender</h4></td>
                  <td style='text-align:center;vertical-align:middle' ><h4>Message</h4></td>
                  <td style='text-align:center;vertical-align:middle'><h4>Attachment</h4></td>
                  <td style='text-align:center;vertical-align:middle'><h4>Received Date</h4></td>
                  
              </tr>
              <tr>
                  <td style='text-align:center;vertical-align:middle'><%=UserAccessServ.sender%></td>
                  <td style='text-align:center;vertical-align:middle' ><%=UserAccessServ.msg%></td>
                  <td style='text-align:center;vertical-align:middle'><a href="OrgDocDownServ?docnm=<%=UserAccessServ.sender+UserAccessServ.doc_name%>" target="_blank"><%=UserAccessServ.doc_name%></a></td>
                  <td style='text-align:center;vertical-align:middle'><%=UserAccessServ.dat%></td>

                  
                  
              </tr>
              
              
          </table>
          <%UserAccessServ.sender="";
             UserAccessServ.msg="";
             UserAccessServ.doc_name="";
             UserAccessServ.dat="";
             
          %>
          
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
