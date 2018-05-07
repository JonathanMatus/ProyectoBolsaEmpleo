/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.proyecto.bolsaempleo.controller;

import com.google.gson.Gson;
import cr.ac.una.prograiv.proyecto.bolsaempleo.bl.impl.LocalizacionBL;
import cr.ac.una.prograiv.proyecto.bolsaempleo.bl.impl.OferenteBL;
import cr.ac.una.prograiv.proyecto.bolsaempleo.domain.Localizacion;
import cr.ac.una.prograiv.proyecto.bolsaempleo.domain.Oferente;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Estudiante
 */
public class OferenteServlet extends HttpServlet {

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
            Oferente ofe = new Oferente();
            Localizacion l = new Localizacion();
            Localizacion l1 = new Localizacion();

            //Se crea el objeto de la logica de negocio
            OferenteBL ofeBL = new OferenteBL();
            LocalizacionBL lpBL = new LocalizacionBL();
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
                case "agregarOferente":
                    //Se llena el objeto con los datos enviados por AJAX por el metodo post
                    ofe.setPkCedula(Integer.parseInt(request.getParameter("cedula")));
                    ofe.setNombre(request.getParameter("nombre"));
                    ofe.setApellido1(request.getParameter("apellido1"));
                    ofe.setApellido2(request.getParameter("apellido2"));
                    ofe.setNacionalidad(request.getParameter("nacionalidad"));
                    ofe.setCorreo(request.getParameter("correo"));
                    ofe.setResidencia(request.getParameter("residencia"));
     
                    //--------------------castear a bigDecimal--------------------------------
                    DecimalFormatSymbols symbols = new DecimalFormatSymbols();
                    symbols.setGroupingSeparator(',');
                    symbols.setDecimalSeparator('.');
                    String pattern = "#,##0.0#";
                    DecimalFormat decimalFormat = new DecimalFormat(pattern, symbols);
                    decimalFormat.setParseBigDecimal(true);

                    // parse the string
                    BigDecimal bigDecimal1 = (BigDecimal) decimalFormat.parse(request.getParameter("latitud"));
                    l.setLatitud(bigDecimal1);
                    BigDecimal bigDecimal2 = (BigDecimal) decimalFormat.parse(request.getParameter("longitud"));
                    l.setLongitud(bigDecimal2);
                    // ----------------------------------------------------------------------------

                    //Guardar Correctamente en la base de datos
                    if (accion.equals("agregarOferente")) { //es insertar personas
                        //Se guarda el objeto
                        lpBL.save(l);
                        List<Localizacion> list = lpBL.findAll(Localizacion.class.getName());

                        l1 = lpBL.findById(list.get(list.size() - 1).getPkIdLocalizacion());
                        ofe.setLocalizacion(l1);
                        ofeBL.save(ofe);

                        //Se imprime la respuesta con el response
                        out.print("C~La empresa fue ingresada correctamente");

                    } else {//es modificar persona
                        //Se guarda el objeto
                        ofeBL.merge(ofe);

                        //Se imprime la respuesta con el response
                        out.print("C~La Empresa fue modificada correctamente");
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
