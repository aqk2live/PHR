/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package comex;

import com.DBConnect;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;


public class AutoGenPatientId {
    
   private static long id;
   static Statement st;
   static DBConnect dbc= new DBConnect();
   
    public static long autoGenId(){ 
       try {
           st=dbc.dbCon();
           
           String sql="select patientid from PHROwner ;";
           
           ResultSet rs = st.executeQuery(sql);
           
           while(rs.next()){
               
               id=Integer.parseInt(rs.getString("patientid"));
           
           
           }
           
           
           id++;
           
             
       } catch (ClassNotFoundException ex) {
           Logger.getLogger(AutoGenOrgId.class.getName()).log(Level.SEVERE, null, ex);
       } catch (SQLException ex) {
           Logger.getLogger(AutoGenOrgId.class.getName()).log(Level.SEVERE, null, ex);
       }
    
       return id; 
    }
    
}
