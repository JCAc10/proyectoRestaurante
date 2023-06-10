/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

public class Productos {
    private int idProducto;
    private String Nom_Product;
    private String Descripcion;
    private int stock;
    private double precio;
    private int idCate;
    private String img_producto;

    public Productos(int idProducto, String Nom_Product, String Descripcion, int stock, double precio, int idCate, String img_producto) {
        this.idProducto = idProducto;
        this.Nom_Product = Nom_Product;
        this.Descripcion = Descripcion;
        this.stock = stock;
        this.precio = precio;
        this.idCate = idCate;
        this.img_producto = img_producto;
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

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getIdCate() {
        return idCate;
    }

    public void setIdCate(int idCate) {
        this.idCate = idCate;
    }

    public String getImg_producto() {
        return img_producto;
    }

    public void setImg_producto(String img_producto) {
        this.img_producto = img_producto;
    }

   


    
}
