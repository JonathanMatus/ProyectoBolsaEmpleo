/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.proyecto.bolsaempleo.test;

import cr.ac.una.prograiv.proyecto.bolsaempleo.bl.impl.LocalizacionBL;
import cr.ac.una.prograiv.proyecto.bolsaempleo.bl.impl.OferenteBL;
import cr.ac.una.prograiv.proyecto.bolsaempleo.dao.impl.CategoriaDao;
import cr.ac.una.prograiv.proyecto.bolsaempleo.dao.impl.UsuarioDao;
import cr.ac.una.prograiv.proyecto.bolsaempleo.domain.Localizacion;
import cr.ac.una.prograiv.proyecto.bolsaempleo.domain.Oferente;
import cr.ac.una.prograiv.proyecto.bolsaempleo.domain.Usuario;
import java.util.Date;
import java.util.List;

/**
 *
 * @author patei
 */
public class test {

    public static void main(String[] arg) {
        LocalizacionBL lpBL = new LocalizacionBL();
        List<Localizacion> list = lpBL.findAll(Localizacion.class.getName());
        Localizacion l1;
        l1=list.get(list.size()-1);
        lpBL.findById(list.get(list.size()).getPkIdLocalizacion());
    }
}
