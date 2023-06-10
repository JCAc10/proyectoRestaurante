/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Utils.ConexionDB;
import Beans.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Elvis
 */
@WebServlet(name = "ServletLogin", urlPatterns = {"/ServletLogin"})
public class ServletLogin extends HttpServlet {

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
        /*try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. 
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletLogin</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletLogin at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }*/
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
        
        HttpSession sesionOk= request.getSession();
        sesionOk.invalidate();
        request.getRequestDispatcher("index.html").forward(request, response);
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
        
        String usu = request.getParameter("txtUsu");
        String pas = request.getParameter("txtPas");
        String[] tip = request.getParameterValues("empleado");
        if(tip!=null){
              try{
            PreparedStatement psta = ConexionDB.getConexion().prepareStatement("SELECT * from empleado where DNI_Emple=? and Password=?");
            psta.setString(1, usu);
            psta.setString(2, pas);
            ResultSet rs= psta.executeQuery();
            if(rs.next()){
                HttpSession sesionOk= request.getSession();
                sesionOk.setAttribute("usuario", rs.getString(2).toString());
                sesionOk.setAttribute("tipo", rs.getString(6));
                request.getRequestDispatcher("Principal_Empleado.jsp").forward(request, response);
               
                }else {
                request.setAttribute("Error","Usuario incorrecto");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }
        }catch(Exception e){
            System.out.println("Error Servlet: " + e);
        }
        }else{
            try{
            PreparedStatement psta = ConexionDB.getConexion().prepareStatement("SELECT * from cliente where Correo_Cliente=? and Password=?");
            psta.setString(1, usu);
            psta.setString(2, pas);
            ResultSet rs= psta.executeQuery();
            if(rs.next()){
                HttpSession sesionOk= request.getSession();
                sesionOk.setAttribute("usuario", rs.getString(2).toString());
                sesionOk.setAttribute("id", rs.getString(1));
                request.getRequestDispatcher("PrincipalCliente.jsp").forward(request, response);
               
                }else {
                request.setAttribute("Error","Usuario incorrecto");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }
        }catch(Exception e){
            System.out.println("Error Servlet: " + e);
        }
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
