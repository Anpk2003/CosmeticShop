/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Phung An
 */
public class Account {

    /*
    	[id] [int] NOT NULL,
	[isAdmin] [bit] NULL,
	[username] [varchar](100) NULL,
	[password] [varchar](32) NULL,
     */
    private int id;
    private String email;
    private boolean isAdmin;
    private String username;
    private String password;

    public Account() {
    }

    public Account(int id, String email, boolean isAdmin, String username, String password) {
        this.id = id;
        this.email = email;
        this.isAdmin = isAdmin;
        this.username = username;
        this.password = password;
    }

 

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public boolean isIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}
