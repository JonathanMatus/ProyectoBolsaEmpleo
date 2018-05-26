/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.proyecto.bolsaempleo.controller;

import com.google.gson.Gson;
import cr.ac.una.prograiv.proyecto.bolsaempleo.bl.impl.CategoriaBL;
import cr.ac.una.prograiv.proyecto.bolsaempleo.bl.impl.SubcategoriaBL;
import cr.ac.una.prograiv.proyecto.bolsaempleo.domain.Categoria;
import cr.ac.una.prograiv.proyecto.bolsaempleo.domain.Subcategoria;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
public class SubCategoriaServlet extends HttpServlet {

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
            Subcategoria p = new Subcategoria();

            //Se crea el objeto de la logica de negocio
            SubcategoriaBL pBL = new SubcategoriaBL();

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
                case "eliminarSubCategoria":

                    p.setPkIdSubcategoria(Integer.parseInt(request.getParameter("idSubCategoria")));

                    //Se elimina el objeto
                    pBL.delete(p);

                    //Se imprime la respuesta con el response
                    out.print("La Categoria fue eliminada correctamente");

                    break;
                case "consultarSubCategorias":
                    json = new Gson().toJson(pBL.findAll(Subcategoria.class.getName()));
                    out.print(json);
                    break;
                case "consultarSubCategoriasByCat":
                    List<Subcategoria> list = pBL.findAll(Subcategoria.class.getName());
                    List<Subcategoria> result=new ArrayList<>();
                    for (int i = 0; i < list.size(); i++) {
                        if (list.get(i).getCategoria() == Integer.parseInt(request.getParameter("idCategoria"))) {
                        result.add(list.get(i));
                        }
                    }
                    json = new Gson().toJson(result);
                    out.print(json);
                    break;
                case "agregarSubCategoria":
                case "modificarSubCategoria":

                    //Se llena el objeto con los datos enviados por AJAX por el metodo post
                    p.setNombreSub(request.getParameter("nombre"));
                    p.setCategoria(Integer.parseInt(request.getParameter("idCategoria")));
                    //Guardar Correctamente en la base de datos
                    if (accion.equals("agregarSubCategoria")) { //es insertar personas
                        //Se guarda el objeto

                        pBL.save(p);

                        //Se imprime la respuesta con el response
                        out.print("C~La SubCategoria fue ingresada correctamente");

                    } else {//es modificar persona
                        //Se guarda el objeto
                        p.setPkIdSubcategoria(Integer.parseInt(request.getParameter("idCategoria")));
                        pBL.merge(p);

                        //Se imprime la respuesta con el response
                        out.print("C~La SubCategoria fue modificada correctamente");
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
