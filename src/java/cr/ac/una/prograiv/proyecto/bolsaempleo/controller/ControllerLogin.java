/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.proyecto.bolsaempleo.controller;

import com.google.gson.Gson;
import cr.ac.una.prograiv.proyecto.bolsaempleo.bl.impl.UsuarioBL;
import cr.ac.una.prograiv.proyecto.bolsaempleo.domain.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class ControllerLogin extends HttpServlet {

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
            Usuario usuario = new Usuario();
            UsuarioBL uBL = new UsuarioBL();
            String accion = request.getParameter("accion");
            Thread.sleep(1000);

            switch (accion) {
                case "loginUsuario":
                    String usuariotext = request.getParameter("usuario");
                    String passwordtext = request.getParameter("password");

                    if (usuariotext.equals("admin") && passwordtext.equals("admin123")) {
                        HttpSession session = request.getSession(true);
                        session.setAttribute("usuario", usuariotext);
                         session.setAttribute("tipo", "Administrador");
                        session.setAttribute("loginStatus", "login");
                        out.print("C~Validación correcta... espere esta siendo redireccionado");
                    } else {
                        usuario = uBL.findByNombreUsuario(usuariotext);

                        if (usuario == null) {
                            out.print("E~Usuario no registrado en el sistema");
                        }
                        if (usuario != null) {
                            if (!usuario.getPassword().equals(passwordtext)) {
                                out.print("E~Usuario o contraseña incorrectos");
                            } else {
                                HttpSession session = request.getSession(true);
                                session.setAttribute("usuario", usuariotext);
                                session.setAttribute("tipo", "Administrador");
                                session.setAttribute("loginStatus", "login");
                                out.print("C~Validación correcta... espere esta siendo redireccionado");
                            }
                        }
                    }

                    break;

                default:
                    out.print("E~No se indico la acción que se desea realizare");
                    break;
            }
        } catch (NumberFormatException e) {
            out.print("E~" + e.getMessage());
        } catch (Exception e) {
            out.print("E~" + e.getMessage());
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
