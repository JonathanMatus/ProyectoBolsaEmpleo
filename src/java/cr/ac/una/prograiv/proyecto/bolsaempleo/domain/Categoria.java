package cr.ac.una.prograiv.proyecto.bolsaempleo.domain;
// Generated 04-may-2018 22:36:55 by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Categoria generated by hbm2java
 */
public class Categoria  implements java.io.Serializable {


     private Integer pkIdCategoria;
     private String nombreCat;
     private int ultimoUsuario;
     private Date fechaCambios;
     private Set<Subcategoria> subcategorias = new HashSet<Subcategoria>(0);

    public Categoria() {
    }

	
    public Categoria(String nombreCat, int ultimoUsuario, Date fechaCambios) {
        this.nombreCat = nombreCat;
        this.ultimoUsuario = ultimoUsuario;
        this.fechaCambios = fechaCambios;
    }
    public Categoria(String nombreCat, int ultimoUsuario, Date fechaCambios, Set<Subcategoria> subcategorias) {
       this.nombreCat = nombreCat;
       this.ultimoUsuario = ultimoUsuario;
       this.fechaCambios = fechaCambios;
       this.subcategorias = subcategorias;
    }
   
    public Integer getPkIdCategoria() {
        return this.pkIdCategoria;
    }
    
    public void setPkIdCategoria(Integer pkIdCategoria) {
        this.pkIdCategoria = pkIdCategoria;
    }
    public String getNombreCat() {
        return this.nombreCat;
    }
    
    public void setNombreCat(String nombreCat) {
        this.nombreCat = nombreCat;
    }
    public int getUltimoUsuario() {
        return this.ultimoUsuario;
    }
    
    public void setUltimoUsuario(int ultimoUsuario) {
        this.ultimoUsuario = ultimoUsuario;
    }
    public Date getFechaCambios() {
        return this.fechaCambios;
    }
    
    public void setFechaCambios(Date fechaCambios) {
        this.fechaCambios = fechaCambios;
    }
    public Set<Subcategoria> getSubcategorias() {
        return this.subcategorias;
    }
    
    public void setSubcategorias(Set<Subcategoria> subcategorias) {
        this.subcategorias = subcategorias;
    }




}


