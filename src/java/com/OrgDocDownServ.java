/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class OrgDocDownServ extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //response.setContentType("text/html;charset=UTF-8");
        //PrintWriter out = response.getWriter();
        try {
            
            String filename=request.getParameter("docnm");
            //out.println("<h1>"+filename+"</h1>");
            
            String pdfFileName = "files\\"+filename;
		String contextPath = getServletContext().getRealPath(File.separator);
		File pdfFile = new File(contextPath + pdfFileName);

                response.addHeader("Content-Disposition", " filename=" + pdfFileName);
                
                //To open pdf as attachment use code below
		//response.addHeader("Content-Disposition", "attachment; filename=" + pdfFileName);

		response.setContentLength((int) pdfFile.length());

		FileInputStream fileInputStream = new FileInputStream(pdfFile);
		ServletOutputStream responseOutputStream = response.getOutputStream();
		int bytes;
		while ((bytes = fileInputStream.read()) != -1) {
			responseOutputStream.write(bytes);
		}
            
            
            
            
            
        } 
        catch(Exception e){
        
            javax.swing.JOptionPane.showMessageDialog(null,e);
        
        }finally {
            //out.close();
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
