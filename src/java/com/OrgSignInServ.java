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

/**
 *
 * @author Abdulquader
 */
public class OrgSignInServ extends HttpServlet {

    public static String username,orgid;
    public static String err="";
    ResultSet rs2;
    Statement st2;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrgSignInServ</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrgSignInServ at " + request.getContextPath() + "</h1>");
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

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html");
            
            username = request.getParameter("username");
            String password = request.getParameter("password");
            
            DBConnect dbc = new DBConnect();
            
            st2 = dbc.dbCon();
            
            String sql = "select * from orgs where uname='"+username+"' and password='"+password+"' ;";
            
             rs2 = st2.executeQuery(sql);
            
            if(rs2.next()){
       
                orgid=rs2.getString("orgid");
                RequestDispatcher req=request.getRequestDispatcher("OrgWindow.jsp"); 
                req.forward(request, response);
                 
            }
            else{
            
            RequestDispatcher req=request.getRequestDispatcher("OrgSignInFail.jsp"); 
                req.forward(request, response);
                
            }
        } catch (Exception ex) {
            err=ex.toString();
        }
        finally{
            try {
               
                rs2.close();
                st2.close();
            } catch (SQLException ex) {
                Logger.getLogger(OrgSignInServ.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
