package Beans;


public class usuarioBeans {
    private int codigo;
    private String nombre;
    private String apellido;
    private String DNI;
    private String pass;
    private int idCargo;

    public usuarioBeans(int codigo, String nombre, String apellido, String DNI, String pass, int idCargo) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.apellido = apellido;
        this.DNI = DNI;
        this.pass = pass;
        this.idCargo = idCargo;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getDNI() {
        return DNI;
    }

    public void setDNI(String DNI) {
        this.DNI = DNI;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int getIdCargo() {
        return idCargo;
    }

    public void setIdCargo(int idCargo) {
        this.idCargo = idCargo;
    }
    
    
}
