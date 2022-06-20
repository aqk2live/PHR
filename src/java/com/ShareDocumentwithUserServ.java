

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
import javax.swing.JOptionPane;


public class ShareDocumentwithUserServ extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String dat=""+new Date();
            String enckey=request.getParameter("enckey");
            String docname=request.getParameter("dd");
            String name=request.getParameter("name");
            String email=request.getParameter("email");
            String msg=request.getParameter("msg");
            
            DBConnect dbc = new DBConnect();
            
            Statement st = dbc.dbCon();
            
            String sql =  "insert into sharedocs(enckey,doc_name,sender,sharedto,email,msg,dat)values"
                    + "('"+enckey+"','"+docname+"','"+PHROwnerSignInServ.username+"','"+name+"','"+email+"','"
                    +msg+"','"+dat+"');";
          
             int rows=st.executeUpdate(sql);
            
             if(rows>0){
             RequestDispatcher rd = request.getRequestDispatcher("SharedSuccess.jsp");
             rd.forward(request, response);
             }
             
        } 
        catch(Exception e){
        JOptionPane.showMessageDialog(null, e);
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
