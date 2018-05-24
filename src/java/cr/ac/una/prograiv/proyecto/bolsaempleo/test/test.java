/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.proyecto.bolsaempleo.test;

import com.google.gson.Gson;
import cr.ac.una.prograiv.proyecto.bolsaempleo.bl.impl.EmpresaBL;
import cr.ac.una.prograiv.proyecto.bolsaempleo.bl.impl.LocalizacionBL;
import cr.ac.una.prograiv.proyecto.bolsaempleo.bl.impl.OferenteBL;
import cr.ac.una.prograiv.proyecto.bolsaempleo.dao.impl.CategoriaDao;
import cr.ac.una.prograiv.proyecto.bolsaempleo.dao.impl.UsuarioDao;
import cr.ac.una.prograiv.proyecto.bolsaempleo.domain.Empresa;
import cr.ac.una.prograiv.proyecto.bolsaempleo.domain.Localizacion;
import cr.ac.una.prograiv.proyecto.bolsaempleo.domain.Oferente;
import cr.ac.una.prograiv.proyecto.bolsaempleo.domain.Usuario;
import java.util.Date;
import java.util.List;
import static javax.ws.rs.client.Entity.json;

/**
 *
 * @author patei
 */
public class test {

    public static void main(String[] arg) {
       // EmpresaBL pBL = new EmpresaBL();

//       List<Empresa> json=pBL.findAll(Empresa.class.getName());
//       for(int i=0;i<json.size();i++)
//        System.out.print(json.get(i).getNombre());
//        LocalizacionBL lpBL = new LocalizacionBL();
//        Localizacion l1 = lpBL.findById(2);
//        Empresa l = pBL.findById(1);
        OferenteBL ofbl = new OferenteBL();
     
//        ofbl.findById(702330480);
//        System.out.println("Nombre:" + ofbl.findById(ofe.sgetPkCedula()).getApellido1());

        
          List<Oferente> list;
          list = ofbl.findByQuery("Select * from  mydbproyecto.oferente where oferente.Usuario_PK_Usuario is null");
          for(int i=0;i<list.size();i++){
          System.out.println(list.get(i));
          }
          
          
          
            
        
    }
}
