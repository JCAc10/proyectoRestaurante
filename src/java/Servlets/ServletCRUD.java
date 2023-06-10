/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Utils.ConexionDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Elvis
 */
@WebServlet(name = "ServletCRUD", urlPatterns = {"/ServletCRUD"})
public class ServletCRUD extends HttpServlet {

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
        String op = request.getParameter("op");
        if (op.equals("eliminar")) {
            String cod = request.getParameter("cod");
            try {
                PreparedStatement psta = ConexionDB.getConexion().prepareStatement("delete from producto where id_producto=?");
                psta.setString(1, cod);
                psta.executeUpdate();
                request.getRequestDispatcher("Principal_Empleado.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error" + e);
            }
        }//INSERTAR PRODUCTOS
        else if (op.equals("insertar")) {
            try {
                System.out.println("entra");
                PreparedStatement psta = ConexionDB.getConexion().prepareStatement("insert into producto values(?,?,?,?,?,?)");
                int ID= Integer.parseInt(request.getParameter("idProducto"));
                String nombre = request.getParameter("nombreProducto");
                String descripcion = request.getParameter("descripcionProducto");
                double precio = Double.parseDouble(request.getParameter("precioProducto"));
                int categoria = Integer.parseInt(request.getParameter("categoriaProducto"));
                String imagen = request.getParameter("rutaImagen");
                psta.setInt(1,ID);
                psta.setString(2, nombre);
                psta.setString(3, descripcion);
                psta.setInt(4, categoria);
                psta.setDouble(5, precio);
                psta.setString(6, imagen);
                psta.executeUpdate();
                request.getRequestDispatcher("Principal_Empleado.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error" + e);
            }
        }
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
