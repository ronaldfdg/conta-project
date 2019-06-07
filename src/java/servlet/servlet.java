/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import bean.kardex;
import dao.dao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Aaron
 */
@WebServlet(name = "servlet", urlPatterns = {"/servlet"})
public class servlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
     
           dao cd = new dao();
        kardex kardex = null;
        int entrada, salida;
        double precio;
        
        
        String entradaCad, salidaCad, precioCad;
        entradaCad = request.getParameter("txtEnt");
        salidaCad = request.getParameter("txtSal");
        precioCad = request.getParameter("txtPrecio");

        if (request.getParameter("btnReg") != null) {
            int existencia = 0;
            if ( entradaCad != null) {
                entrada = Integer.parseInt(entradaCad);
                existencia = existencia + entrada;
                salida = 0;
                precio = Double.parseDouble(precioCad);
                cd.registrarCuenta(new kardex(entrada, salida, precio, existencia));
                //request.getRequestDispatcher("index.jsp").forward(request, response);
            }else if(salidaCad != "" ) {
                entrada = 0;
                /*salida = Integer.parseInt(salidaCad);
                
                existencia = existencia - salida;
                precio = Double.parseDouble(precioCad);
                cd.registrarCuenta(new kardex(entrada, salida, precio, existencia));
                */if(request.getParameter("metodo")!=null){
                    if( salidaCad !=null ){
                     cd.editarCuenta(Integer.parseInt(salidaCad), request.getParameter("metodo"));
                    }
                }
                //request.getRequestDispatcher("index.jsp").forward(request, response);
            }
            
            
        } else if(request.getParameter("Limpiar")!=null){
            cd.limpiar();
        }
        
        
        
        
        
        request.getRequestDispatcher("index.jsp").forward(request, response);
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
