/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Beans.Cesta_Usuario;
import Utils.ConexionDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "ServletCarrito", urlPatterns = {"/ServletCarrito"})
public class ServletCarrito extends HttpServlet {
    public static String FechaActual(){
        Date fecha = new Date();
        SimpleDateFormat formatoFecha = new SimpleDateFormat("YYY/MM/dd");//"dd/MM/YYYY"
        return formatoFecha.format(fecha);
    }
    
    public static String IdUltimoPedido(){
        try{
                 String SQL = "SELECT MAX(idPedido) AS idPedido FROM pedido";
                 Statement stmt = ConexionDB.getConexion().createStatement();
                  ResultSet rs = stmt.executeQuery(SQL);
                  while(rs.next()){
                  return rs.getString("id");
                  }
        }catch(Exception e){
            System.out.println("Error: " + e);
        }
        return "null";
    }
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
       /* try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. 
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletCarrito</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletCarrito at " + request.getContextPath() + "</h1>");
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
        String op = request.getParameter("op"); 
        
        if(op.equals("anadir")){
            HttpSession sesion = request.getSession();
            ArrayList<Cesta_Usuario> carrito;
            if(sesion.getAttribute("carrito")==null){
                carrito = new ArrayList<Cesta_Usuario>();
            } else{
                carrito=(ArrayList<Cesta_Usuario>)sesion.getAttribute("carrito");
            }
            int cod = Integer.parseInt(request.getParameter("cod"));
            String des = request.getParameter("nom");
            double pre= Double.parseDouble(request.getParameter("precio"));
            
            int indice=-1;
            int can=0;
            
            for(int i=0; i<carrito.size();i++){
                Cesta_Usuario c2=carrito.get(i);
                if(c2.getIdProducto()==cod){
                    indice=i;
                    can=c2.getCantidad();
                    break;
                }
            }
            if(indice==-1){
                Cesta_Usuario c= new Cesta_Usuario(cod, des, pre, 1);
                carrito.add(c);
            }else{
                int can2 = can+1;
                Cesta_Usuario c3=new Cesta_Usuario(cod, des, pre, can2);
                carrito.set(indice, c3);
            }
            
            sesion.setAttribute("carrito", carrito);
            response.sendRedirect("Cesta_Usuario.jsp");

        } else if (op.equals("comprar")){
            int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
            double total = Double.parseDouble(request.getParameter("total"));
            int tam = Integer.parseInt(request.getParameter("tam"));
            String estado="Cancelado";
            try{
                 
                 String SQL = "insert into pedido (idCliente, fecha_emision, monto_pagar, Estado) values (?,?,?,?)";
                 PreparedStatement psta =ConexionDB.getConexion().prepareStatement(SQL);
                 psta.setInt(1, idUsuario);
                 psta.setString(2, FechaActual());
                 psta.setDouble(3, total);
                 psta.setString(4, estado);
                 psta.executeUpdate();
                 for(int i = 0; i<=tam; i++){
                 String SQL1 = "INSERT INTO detalle_pedido(idPedido, idProducto, Cantidad) VALUES (?,?,?)";
                 PreparedStatement psta2 =ConexionDB.getConexion().prepareStatement(SQL1);
                 psta2.setString(1, IdUltimoPedido());
                 psta2.setString(2, FechaActual());
                 psta2.setString(3, FechaActual());
                 psta2.executeUpdate();
                 }
                 request.getRequestDispatcher("PrincipalCliente.jsp").forward(request, response);
            }catch(Exception e){
                request.getRequestDispatcher("PrincipalCliente.jsp").forward(request, response);
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
