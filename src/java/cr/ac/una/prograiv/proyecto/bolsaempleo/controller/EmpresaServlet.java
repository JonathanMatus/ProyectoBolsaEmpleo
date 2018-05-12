/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.proyecto.bolsaempleo.controller;

import com.google.gson.Gson;
import cr.ac.una.prograiv.proyecto.bolsaempleo.bl.impl.EmpresaBL;
import cr.ac.una.prograiv.proyecto.bolsaempleo.bl.impl.LocalizacionBL;
import cr.ac.una.prograiv.proyecto.bolsaempleo.domain.Empresa;
import cr.ac.una.prograiv.proyecto.bolsaempleo.domain.Localizacion;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.math.BigDecimal;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author patei
 */
public class EmpresaServlet extends HttpServlet {

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
            Empresa p = new Empresa();
            Localizacion l = new Localizacion();
            
            //Se crea el objeto de la logica de negocio
            EmpresaBL pBL = new EmpresaBL();
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
                case "eliminarEmpresa":

                    p.setPkIdEmp(Integer.parseInt(request.getParameter("idEmpresa")));

                    //Se elimina el objeto
                    pBL.delete(p);

                    //Se imprime la respuesta con el response
                    out.print("La empresa fue eliminada correctamente");

                    break;
                case "consultarEmpresas":
                    json = new Gson().toJson(pBL.findAll(Empresa.class.getName()));
                    out.print(json);
                    break;
                case "agregarEmpresa":
                case "modificarEmpresa":

                    //Se llena el objeto con los datos enviados por AJAX por el metodo post
                    p.setNombre(request.getParameter("nombre"));
                    p.setCorreo(request.getParameter("correo"));
                    p.setDescripcion(request.getParameter("descripcion"));
                    p.setTelefono(request.getParameter("telefono"));
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
                    if (accion.equals("agregarEmpresa")) { //es insertar personas
                        //Se guarda el objeto
                        lpBL.save(l);
                        List<Localizacion> list = lpBL.findAll(Localizacion.class.getName());

                        l = lpBL.findById(list.get(list.size() - 1).getPkIdLocalizacion());
                        p.setLocalizacion(l.getPkIdLocalizacion());
                        pBL.save(p);

                        //Se imprime la respuesta con el response
                        out.print("C~La empresa fue ingresada correctamente");

                    } else {//es modificar persona
                        //Se guarda el objeto
                        pBL.merge(p);

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
