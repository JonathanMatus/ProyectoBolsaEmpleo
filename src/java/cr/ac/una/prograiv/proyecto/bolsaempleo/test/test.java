/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.proyecto.bolsaempleo.test;

import cr.ac.una.prograiv.proyecto.bolsaempleo.dao.impl.UsuarioDao;
import cr.ac.una.prograiv.proyecto.bolsaempleo.domain.Usuario;
import java.util.Date;

/**
 *
 * @author patei
 */
public class test {
    
    public static void main(String[] arg) {
        UsuarioDao usuarioDao = new UsuarioDao();
        Usuario usuario = new Usuario("pateixo@gmail.com", "pateixo1", "password", new Date(), "Admin");
        usuarioDao.delete(usuario);
        
    }
}
