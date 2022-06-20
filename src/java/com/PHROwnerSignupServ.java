/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com;

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
public class PHROwnerSignupServ extends HttpServlet {

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
            out.println("<title>Servlet PHROwnerSignupServ</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PHROwnerSignupServ at " + request.getContextPath() + "</h1>");
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
            
            String username=request.getParameter("username");
            String password=request.getParameter("password");
            String date=request.getParameter("date");
            String patientId=request.getParameter("patientid");
            String name=request.getParameter("name");
            String fname=request.getParameter("fname");
            String age=request.getParameter("age");
            String dob=request.getParameter("dob");
            String sex=request.getParameter("sex");
            String mar_status=request.getParameter("ms");
            String blood=request.getParameter("bg");
            String weight=request.getParameter("wt");
            String phno=request.getParameter("phno");
            String email=request.getParameter("email");
            String address=request.getParameter("address");
            String ailments_past=request.getParameter("ail_past");
            String trmnts_done=request.getParameter("treatments");
            String operations=request.getParameter("operation");
            String hospitals_visited=request.getParameter("hospitals");
            String major_health=request.getParameter("major_health");
            String condition=request.getParameter("condition");
            
            DBConnect dbc = new DBConnect();
            
            Statement st = dbc.dbCon();
            
            String sql = "insert into PHROwner(patientid,username,password,date,name,fname,age,dob,sex,mar_status,blood,weight,phno,email,address,ailments_past,trmnts_done,operations,hospitals_visited,major_health,condi)values"
                    + "('"+patientId+"','"+username+"','"+password+"','"+date+"','"+name+"','"
                    +fname+"','"+age+"','"+dob+"','"+sex+"','"+mar_status+"','"+blood+"','"+weight+"','"+phno+"','"+email+
                    "','"+address+"','"+ailments_past+"','"+trmnts_done+"','"+operations+"','"+hospitals_visited+"','"+major_health+"','"+condition+"');";
            
            int i = st.executeUpdate(sql);
            
            if(i>0){
            
                RequestDispatcher req=request.getRequestDispatcher("PHROwnerSignupSuccess.jsp"); 
                req.forward(request, response);
            
            }
            else{
                
            RequestDispatcher req=request.getRequestDispatcher("PHROwnerSignupFail.jsp"); 
                req.forward(request, response);
            
            }
            
        } catch (Exception ex) {
            RequestDispatcher req=request.getRequestDispatcher("PHROwnerSignupFail.jsp"); 
                req.forward(request, response);
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
