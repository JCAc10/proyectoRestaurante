package Beans;

public class Cesta {
    private int idProducto;
    private String Nom_Product;
    private double precio;
    private int cantidad;

    public Cesta(int idProducto, String Nom_Product, double precio, int cantidad) {
        this.idProducto = idProducto;
        this.Nom_Product = Nom_Product;
        this.precio = precio;
        this.cantidad = cantidad;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getNom_Product() {
        return Nom_Product;
    }

    public void setNom_Product(String Nom_Product) {
        this.Nom_Product = Nom_Product;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }


    
}
