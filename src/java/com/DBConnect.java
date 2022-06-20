/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;


public class DBConnect {
  //  private Connection conn;
  // private Statement stmt;
    
    public  Statement dbCon() throws ClassNotFoundException, SQLException{
        
            Class.forName("com.mysql.jdbc.Driver");
           Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/phr","root","pass");
            
           
            Statement stmt =  conn.createStatement();
            
        
             return stmt;  
               
          
         

        
    
    
    }
    
    public static void main(String args[]){
    
        
        //dbCon();
        
    
    }
    
}
