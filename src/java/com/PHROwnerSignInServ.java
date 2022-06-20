/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Abdulquader
 */
public class PHROwnerSignInServ extends HttpServlet {

    public static String username,patient_id;
    public static String err;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PHROwnerSignInServ</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PHROwnerSignInServ at " + request.getContextPath() + "</h1>");
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
            response.setContentType("text/html");
            
            username = request.getParameter("username");
            String password = request.getParameter("password");
            
             

            DBConnect dbc = new DBConnect();
            
            Statement st = dbc.dbCon();
            
            String sql = "select * from phrowner where username='"+username+"' and password='"+password+"' ;";
            
            ResultSet rs = st.executeQuery(sql);
            
            if(rs.next()){
                
             HttpSession session=request.getSession();  
             session.setAttribute("username",username);  
             
             patient_id=rs.getString("patientid");
             
                 RequestDispatcher req=request.getRequestDispatcher("PHROwnerWindow.jsp"); 
                req.forward(request, response);
            
            }
            else{
        
            RequestDispatcher req=request.getRequestDispatcher("PHROwnerSignInFail.jsp"); 
                req.forward(request, response);
            
        
            }
            
            
            
        } catch (Exception ex) {
            err= ex.toString();
        } 
        
        
        
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
