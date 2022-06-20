/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Statement;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;

import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

/**
 *
 * @author Abdulquader
 */
public class UploadFile extends HttpServlet {

    String saveFile ="C:\\Users\\Abdulquader\\Documents\\NetBeansProjects\\PHR\\web\\files";
    
    String uname,docid,itemname,patient_id,description;
    HttpSession session;
    
    		//String saveFile = getServletContext().getRealPath(File.separator)+"\\files";

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
           description=request.getParameter("descs");
        uname=PHROwnerSignInServ.username;  

        //description=request.getParameter("descs");
        
        try {
           
            boolean ismultipart = ServletFileUpload.isMultipartContent(request);
            if(!ismultipart){
            
            }
            else{
              FileItemFactory factory = new DiskFileItemFactory(); 
              ServletFileUpload upload  = new ServletFileUpload(factory);
              
              List items = null;
              items = upload.parseRequest(request);
                
              Iterator itr = items.iterator();
              while(itr.hasNext()){
              
                  FileItem item  = (FileItem)itr.next();
                  if(item.isFormField()){
                  
                      
                  }
                  else{
                       itemname = item.getName();
                       if((itemname==null)|| itemname.equals("")){
                       continue;
                       } 
                       
                       String filename = FilenameUtils.getName(itemname);
                       File f = checkExist(filename);
                       item.write(f);
                       
                       // saving data about document in database table doc_id=docid , doc_name=itemname , patient_id=PHROwnerSignInServ.patient_id
                       patient_id=PHROwnerSignInServ.patient_id;
                       DBConnect dbc = new DBConnect();
            
                        Statement st = dbc.dbCon();
                        
                        String sql = "INSERT INTO phrownerdocs("+"doc_id,"+"doc_name,"+"patientid,"+"description)"+"values"
                    +                  "('"+docid+"','"+itemname+"','"+patient_id+"','"+description+"') ;";
                        
                        int rows_inserted=st.executeUpdate(sql);
                        
                        if(rows_inserted>0){
                        
                             RequestDispatcher req=request.getRequestDispatcher("PHRDocumentUploadSuccess.jsp"); 
                             req.forward(request, response);
                        
                        }
                       
                       
                       // when document is uploaded print this message
                      // out.println("Document successfully uploaded  !!!");
                       
                  }
              }
              
            }
           
        } 
        catch(Exception e){
        javax.swing.JOptionPane.showMessageDialog(null,e);
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
        description=request.getParameter("descs");
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

    private File checkExist(String fileName){
        
        docid=uname+fileName;
   //  want to prepend test to file name
    File f = new File(saveFile+"/"+uname+fileName);
    
    if(f.exists()){
    StringBuffer sb = new StringBuffer(fileName);
    sb.insert(sb.lastIndexOf("."), "-"+new Date().getTime());
    f = new File(saveFile+"/"+sb.toString());
    }

return f;
}
    
}
