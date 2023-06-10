/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Beans.Cesta;
import Beans.Productos;
import Utils.ConexionDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.Set;
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
@WebServlet(name = "ServletPro", urlPatterns = {"/ServletPro"})
public class ServletPro extends HttpServlet {

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
       // try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
      /*      out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletPro</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletPro at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");*/
       // }
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
      if(op.equals("listarPro")){
            try{
                PreparedStatement psta =ConexionDB.getConexion().prepareStatement("SELECT * FROM producto");
                ResultSet rs = psta.executeQuery();
                ArrayList<Productos> lista= new ArrayList<>();
            while(rs.next()){
                Productos pro = new Productos (rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4),rs.getDouble(5),rs.getInt(6), rs.getString(7));
                lista.add(pro); 
            }
           
            System.out.println("Lista : " + lista.size());
            request.setAttribute("listita", lista);
                System.out.println(lista);
            request.getRequestDispatcher("Catalogo.jsp").forward(request, response);
            }catch(Exception e){
                System.out.println("Error: " + e);
            }
            
        }else if(op.equals("anadir")){
            HttpSession sesion = request.getSession();
            ArrayList<Cesta> carrito;
            if(sesion.getAttribute("carrito")==null){
                carrito = new ArrayList<Cesta>();
            } else{
                carrito=(ArrayList<Cesta>)sesion.getAttribute("carrito");
            }
            int cod = Integer.parseInt(request.getParameter("cod"));
            String des = request.getParameter("nom");
            double pre= Double.parseDouble(request.getParameter("precio"));
            
            int indice=-1;
            int can=0;
            
            for(int i=0; i<carrito.size();i++){
                Cesta c2=carrito.get(i);
                if(c2.getIdProducto()==cod){
                    indice=i;
                    can=c2.getCantidad();
                    break;
                }
            }
            if(indice==-1){
                Cesta c= new Cesta(cod, des, pre, 1);
                carrito.add(c);
            }else{
                int can2 = can+1;
                Cesta c3=new Cesta(cod, des, pre, can2);
                carrito.set(indice, c3);
            }
            sesion.setAttribute("carrito", carrito);
            response.sendRedirect("Cesta.jsp");
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
