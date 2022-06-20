

package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class UserAccessServ extends HttpServlet {

   public static String sender="",msg="",doc_name="",dat="";
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
            String enckey=request.getParameter("enckey");
            String email=request.getParameter("email");
            
            DBConnect dbc = new DBConnect();
            
            Statement st = dbc.dbCon();
            
            String sql = "select * from sharedocs where email='"+email+"' and enckey='"+enckey+"' ;";
          
             ResultSet rs = st.executeQuery(sql);
             
             if(rs.next()){
             sender=rs.getString("sender");
             msg=rs.getString("msg");
             doc_name=rs.getString("doc_name");
             dat=rs.getString("dat");
             
             RequestDispatcher rd = request.getRequestDispatcher("UserAccess.jsp");
             rd.forward(request, response);
                 
                 
             }
             else{
             RequestDispatcher rd = request.getRequestDispatcher("UserAccessDocDownFail.jsp");
             rd.forward(request, response);
             
             }
            
            
        }catch(Exception e){
        
            javax.swing.JOptionPane.showMessageDialog(null,e);
        
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
