

package com;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Abdulquader
 */
public class PHROwnerDeleteDocServ extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
            
            String filename=PHROwnerSignInServ.username+request.getParameter("dd");
            
           String pdfFileName = "files\\"+filename;
		String contextPath = getServletContext().getRealPath(File.separator);
		File pdfFile = new File(contextPath + pdfFileName);
                
               // FileWriter fw = new FileWriter(filename);
                
                
                 DBConnect dbc = new DBConnect();
            
            Statement st = dbc.dbCon();
            
            String sql = "delete from phrownerdocs where doc_id='"+filename+"' ;";
          
             int no_of_rows = st.executeUpdate(sql);
                
                if(no_of_rows>0){
                
                    RequestDispatcher rd = request.getRequestDispatcher("DocDeleteSuccess.jsp");
                    rd.forward(request, response);
                    //javax.swing.JOptionPane.showMessageDialog(null,filename);
                }
                else{
                 out.println("<h2>File could not be deleted contact admin  </h2>");
                }
            
        } 
        catch(Exception e){
            
            out.println(e);
            }
        finally {
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
