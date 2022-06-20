<%-- 
    Document   : PHROwnerSignup
    Created on : 7-Oct-2014, 12:19:08 PM
    Author     : Abdulquader
--%>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Sign Up | Patient</title>
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
          <li><a href="PHROwnerSignIn.jsp">Sign In</a></li>
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
          
          <form  action="PHROwnerSignupServ" method="post">
          
              <h3>Account details</h3><br/>
              
              <table style="width:100%">
                  
                 <tr>
    <td>User Name :  </td>
    <td><input type="text" name="username"/></td>      
  </tr>
      <tr>
    <td>Password :  </td>
    <td><input type="password" name="password"/></td>    
  </tr>
                  
                  
              </table><br/>
          
              <h3>Personal details</h3><br/>
  
  <table style="width:100%">
      
      <tr>
    <td>Date & Time :  </td>
    <td><input readonly type="text" name="date" value="<%=new Date()%>" size='30'/></td>    
      </tr>    
      
      <tr>
    <td>Patient's ID  :  </td>
    <td><input readonly type="text" name="patientid" value="<%=comex.AutoGenPatientId.autoGenId()%>" /></td>    
      </tr>    
      
      <tr>
    <td> Name :  </td>
    <td><input type="text" name="name" /></td>    
  </tr>    
      
      <tr>
    <td>Father Name :  </td>
    <td><input type="text" name="fname" /></td>    
  </tr>  
      
      <tr>
    <td>Age :  </td>
    <td><input type="text" name="age" value="" size="3"/></td>    
      </tr>  
      
      <tr>
    <td>Date of Birth :  </td>
    <td><input type="date" name="dob"></td>    
  </tr>  
      
      <tr>
          <td>Sex : </td>
          <td><input type="radio" name="sex" value="male">Male &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="radio" name="sex" value="female">Female </td>
      </tr>
    
      <tr>
          <td>Marital status : </td>
          <td><input type="radio" name="ms" value="male">Married &nbsp;&nbsp;&nbsp;&nbsp;
              <input type="radio" name="ms" value="female">UnMarried </td>
      </tr>
      
      <tr>
      <td>Blood Group :  </td>
    <td><input type="text" name="bg"  size="3"/></td>    
      </tr>
      
      <tr>
      <td>Weight :  </td>
    <td><input type="text" name="wt"  size="3"/>&nbsp;&nbsp Kgs</td>    
      </tr>
      
      <tr>
    <td> Phone number :  </td>
    <td><input type="text" name="phno" /></td>    
  </tr>    
      
      <tr>
    <td> Email Id :  </td>
    <td><input type="text" name="email" /></td>    
  </tr> 
      
      <tr>
    <td>Address :  </td>
    <td><textarea rows="4" cols="50" name="address"></textarea></td>    
  </tr>
  
  </table><br/>
  
  <h3>Medical History</h3><br/>
      
  
  <table style="width:100%">
       
      <tr>
    <td>Major ailments suffered in past : <br/>  
           (mention all)  </td>
    <td><input type="text" name="ail_past"/></td>    
  </tr>
      <tr>
          
    <td>Treatments done :  <br/>  
           (mention all)</td>
    <td><input type="text" name="treatments"/></td>    
  </tr>
      
      <tr>
    <td>Any major operation undergone :  </td>
    <td><input type="text" name="operation"/></td>    
  </tr>  
      
  <tr>
    <td>Hospitals visited :  </td>
    <td><input type="text" name="hospitals"/></td>    
  </tr>
  <tr>
    <td>Any major Health problem now :  </td>
    <td><input type="text" name="major_health"/></td>    
  </tr>     
           
     
      
      <tr>
          
    <td>Describe your condition :  <br/>  
           (upto 255 characters)</td>
    <td><textarea rows="4" cols="50" name="condition"></textarea></td>    
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

