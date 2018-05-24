/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.proyecto.bolsaempleo.controller;

import com.google.gson.Gson;
import cr.ac.una.prograiv.proyecto.bolsaempleo.bl.impl.PuestoBL;
import cr.ac.una.prograiv.proyecto.bolsaempleo.domain.Puesto;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Estudiante
 */
public class PuestoServlet extends HttpServlet {

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
            //String para guardar el JSON generaro por al libreria GSON
            String json;

            //Se crea el objeto Persona
            Puesto p = new Puesto();

            //Se crea el objeto de la logica de negocio
            PuestoBL pBL = new PuestoBL();

            //Se hace una pausa para ver el modal
            Thread.sleep(1000);

            //**********************************************************************
            //se toman los datos de la session
            //**********************************************************************
            HttpSession session = request.getSession();

            //**********************************************************************
            //se consulta cual accion se desea realizar
            //**********************************************************************
            String accion = request.getParameter("accion");
            switch (accion) {
                case "eliminarPuesto":

                    p.setPkIdPuesto(Integer.parseInt(request.getParameter("idPuesto")));

                    //Se elimina el objeto
                    pBL.delete(p);

                    //Se imprime la respuesta con el response
                    out.print("El puesto fue eliminado correctamente");

                    break;
                case "consultarPuestos":
                    json = new Gson().toJson(pBL.findAll(Puesto.class.getName()));
                    out.print(json);
                    break;
                case "agregarPuesto":
                case "modificarPuesto":

                    //Se llena el objeto con los datos enviados por AJAX por el metodo post
                    p.setNombre(request.getParameter("nombre"));
                    p.setEmpresa(Integer.parseInt(request.getParameter("idEmpresa")));
                    p.setTipoPublicacion(request.getParameter("tipo"));
                    

                    //--------------------castear a bigDecimal--------------------------------
                    DecimalFormatSymbols symbols = new DecimalFormatSymbols();
                    symbols.setGroupingSeparator(',');
                    symbols.setDecimalSeparator('.');
                    String pattern = "#,##0.0#";
                    DecimalFormat decimalFormat = new DecimalFormat(pattern, symbols);
                    decimalFormat.setParseBigDecimal(true);

                    // parse the string
                    BigDecimal bigDecimal = (BigDecimal) decimalFormat.parse(request.getParameter("salario"));
                   
                   
                    // ----------------------------------------------------------------------------
                    p.setSalario(bigDecimal);
                    //Guardar Correctamente en la base de datos
                    if (accion.equals("agregarPuesto")) { //es insertar personas
                        //Se guarda el objeto
                        pBL.save(p);
//

                        //Se imprime la respuesta con el response
                        out.print("C~El puesto fue ingresado correctamente");

                    } else {//es modificar persona
                        //Se guarda el objeto
                        pBL.merge(p);

                        //Se imprime la respuesta con el response
                        out.print("C~El puesto fue modificada correctamente");
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
