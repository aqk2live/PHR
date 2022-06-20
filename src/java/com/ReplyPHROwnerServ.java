

package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Statement;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ReplyPHROwnerServ extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String orgname=OrgSignInServ.username;
            String sendto =request.getParameter("rcv");
            String msg=request.getParameter("msg");
            String subj=request.getParameter("subj");
            String dat =""+new Date();
            String doc_name=request.getParameter("dd");
            
            DBConnect dbc = new DBConnect();
            
                        Statement st = dbc.dbCon();
                        
                        String sql = "INSERT INTO replyfromorgs("+"orgname,"+"sendto,"+"msg,"+"dat,"+"subj,"+"doc_name)"+"values"
                    +                  "('"+orgname+"','"+sendto+"','"+msg+"','"+dat+"','"+subj+"','"+doc_name+"') ;";
                        
                        int rows_inserted=st.executeUpdate(sql);
                        
                        if(rows_inserted>0){
                        
                             RequestDispatcher req=request.getRequestDispatcher("ReplyPHROwnerSuccess.jsp"); 
                             req.forward(request, response);
                        
                        }
            
            
            
        } catch(Exception e){
        
        javax.swing.JOptionPane.showMessageDialog(null, e);
            
        }finally {
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
