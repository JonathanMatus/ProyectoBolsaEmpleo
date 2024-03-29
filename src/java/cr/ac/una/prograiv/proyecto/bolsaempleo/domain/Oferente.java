package cr.ac.una.prograiv.proyecto.bolsaempleo.domain;
// Generated 26/05/2018 12:19:33 AM by Hibernate Tools 4.3.1


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

/**
 * Oferente generated by hbm2java
 */
@Entity
@Table(name="oferente"
    ,catalog="mydbproyecto"
    , uniqueConstraints = @UniqueConstraint(columnNames="correo") 
)
public class Oferente  implements java.io.Serializable {


     private int pkCedula;
     private Integer localizacion;
     private Integer usuario;
     private String nombre;
     private String apellido1;
     private String apellido2;
     private String nacionalidad;
     private String correo;
     private String residencia;
     private Integer ultimoUsuario;
     private Date fechaCambios;

    public Oferente() {
    }

	
    public Oferente(int pkCedula, Integer localizacion, String nombre, String apellido1, String apellido2, String nacionalidad, String correo) {
        this.pkCedula = pkCedula;
        this.localizacion = localizacion;
        this.nombre = nombre;
        this.apellido1 = apellido1;
        this.apellido2 = apellido2;
        this.nacionalidad = nacionalidad;
        this.correo = correo;
    }
    public Oferente(int pkCedula, Integer localizacion, Integer usuario, String nombre, String apellido1, String apellido2, String nacionalidad, String correo, String residencia, Integer ultimoUsuario, Date fechaCambios) {
       this.pkCedula = pkCedula;
       this.localizacion = localizacion;
       this.usuario = usuario;
       this.nombre = nombre;
       this.apellido1 = apellido1;
       this.apellido2 = apellido2;
       this.nacionalidad = nacionalidad;
       this.correo = correo;
       this.residencia = residencia;
       this.ultimoUsuario = ultimoUsuario;
       this.fechaCambios = fechaCambios;
    }
   
     @Id 

    
    @Column(name="Pk_Cedula", unique=true, nullable=false)
    public int getPkCedula() {
        return this.pkCedula;
    }
    
    public void setPkCedula(int pkCedula) {
        this.pkCedula = pkCedula;
    }


    @Column(name="Fk_Localizacion", nullable=false)
    public Integer getLocalizacion() {
        return this.localizacion;
    }
    
    public void setLocalizacion(Integer localizacion) {
        this.localizacion = localizacion;
    }

    @Column(name="Usuario_PK_Usuario")
    public Integer getUsuario() {
        return this.usuario;
    }
    
    public void setUsuario(Integer usuario) {
        this.usuario = usuario;
    }

    
    @Column(name="nombre", nullable=false, length=45)
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    
    @Column(name="apellido1", nullable=false, length=45)
    public String getApellido1() {
        return this.apellido1;
    }
    
    public void setApellido1(String apellido1) {
        this.apellido1 = apellido1;
    }

    
    @Column(name="apellido2", nullable=false, length=45)
    public String getApellido2() {
        return this.apellido2;
    }
    
    public void setApellido2(String apellido2) {
        this.apellido2 = apellido2;
    }

    
    @Column(name="nacionalidad", nullable=false, length=45)
    public String getNacionalidad() {
        return this.nacionalidad;
    }
    
    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }

    
    @Column(name="correo", unique=true, nullable=false, length=45)
    public String getCorreo() {
        return this.correo;
    }
    
    public void setCorreo(String correo) {
        this.correo = correo;
    }

    
    @Column(name="residencia", length=45)
    public String getResidencia() {
        return this.residencia;
    }
    
    public void setResidencia(String residencia) {
        this.residencia = residencia;
    }

    
    @Column(name="ultimoUsuario")
    public Integer getUltimoUsuario() {
        return this.ultimoUsuario;
    }
    
    public void setUltimoUsuario(Integer ultimoUsuario) {
        this.ultimoUsuario = ultimoUsuario;
    }

    @Temporal(TemporalType.DATE)
    @Column(name="fechaCambios", length=10)
    public Date getFechaCambios() {
        return this.fechaCambios;
    }
    
    public void setFechaCambios(Date fechaCambios) {
        this.fechaCambios = fechaCambios;
    }




}


