/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Phung An
 */
public class Product {
    /*
    CREATE TABLE [dbo].[Product](
	[id] [int] NOT NULL,
	[category_id] [int] NULL,
	[brand_id] [int] NULL,
	[title] [nvarchar](250) NULL,
	[price] [int] NULL,
	[thumbnail] [nvarchar](500) NULL,
	[description] [nvarchar](1000) NULL,
	[deleted] [int] NULL,
    */
    private int id;
    private int category_id;
    private int brand_id;
    private String title;
    private double price;
    private String thumbnail;
    private String description;
    private int quantity;
 

    public Product() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public int getBrand_id() {
        return brand_id;
    }

    public void setBrand_id(int brand_id) {
        this.brand_id = brand_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Product(int id, int category_id, int brand_id, String title, double price, String thumbnail, String description) {
        this.id = id;
        this.category_id = category_id;
        this.brand_id = brand_id;
        this.title = title;
        this.price = price;
        this.thumbnail = thumbnail;
        this.description = description;
    }

    public Product(int id, int category_id, int brand_id, String title, double price, String thumbnail, String description, int quantity) {
        this.id = id;
        this.category_id = category_id;
        this.brand_id = brand_id;
        this.title = title;
        this.price = price;
        this.thumbnail = thumbnail;
        this.description = description;
        this.quantity = quantity;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }


   
    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", category_id=" + category_id + ", brand_id=" + brand_id + ", title=" + title + ", price=" + price + ", thumbnail=" + thumbnail + ", description=" + description + '}';
    }
    
    
}
