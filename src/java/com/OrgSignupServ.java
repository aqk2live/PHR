/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Abdulquader
 */
public class OrgSignupServ extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrgSignupServ</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrgSignupServ at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        try {
            response.setContentType("html/text");
            
            String orgid=request.getParameter("orgid");
            String orgname=request.getParameter("orgname");
            String type=request.getParameter("TypeofOrg");
            String uname=request.getParameter("username");
            String password =request.getParameter("password");
            String website=request.getParameter("website");
            String email=request.getParameter("email");
            String cno=request.getParameter("cno");
            String address=request.getParameter("address");
            
            DBConnect dbc = new DBConnect();
            
            Statement st = dbc.dbCon();
            
            String sql = "INSERT INTO orgs("+"orgid,"+"orgname,"+"type,"+"uname,"+"password,"+"website,"+"email,"+"cno,"+"address)"+"values"
                    + "('"+orgid+"','"+orgname+"','"+type+"','"+uname+"','"+password+"','"+website+"','"+email+"','"+cno+"','"+address+"') ;";
            
            int i=st.executeUpdate(sql); 
            
            if(i>0){
            
                
                RequestDispatcher req=request.getRequestDispatcher("OrgSignupSuccess.jsp"); 
                req.forward(request, response);
            
            
            }
            
            
        } catch (SQLException ex) {
            Logger.getLogger(OrgSignupServ.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OrgSignupServ.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
