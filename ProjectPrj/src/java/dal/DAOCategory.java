/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;

/**
 *
 * @author Phung An
 */
public class DAOCategory extends DBContext {
    //hien product 

    public List<Category> getAll() {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[Category]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("id"), rs.getString("name"));
                list.add(c);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    // insert category
    public void insert(Category c) {
        String sql = "INSERT INTO [dbo].[Category]\n"
                + "           ([id]\n"
                + "           ,[name])\n"
                + "     VALUES(?,?) ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, c.getId());
            st.setString(2, c.getName());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    //update category
    public void update(Category c) {
        String sql = "UPDATE [dbo].[Category]\n"
                + "   SET"
                + "[name] = ?\n"
                + " WHERE id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getName());
            st.setInt(2, c.getId());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
        // delete category
    public void removeCategory(int id) {
        String sql = "delete from Category where id = " + id + "and "
                + id + "not in (select distinct category_id from Product)";
        try {
            PreparedStatement state = connection.prepareStatement(sql);
            state.execute();
        } catch (SQLException ex) {
        }
    }
//tim 1 category khi co id

    public Category getCategoryByID(int id) {

        String sql = "SELECT * FROM Category WHERE id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            //giá trị đầu tiên ở vị trí 1 thiết lập với id
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Category c = new Category(rs.getInt("id"), rs.getString("name"));
                return c;
            }
        } catch (SQLException e) {

        }
        return null;
    }
    public static void main(String[] args) {
        DAOCategory d = new DAOCategory();
        List<Category> a = d.getAll();
        System.out.println(a.get(4).getName());
       // d.update(new Category(1, "skincares"));
      //  d.insert(new Category(6, "medicine"));
      Category c= d.getCategoryByID(6);
        System.out.println(c.getName());
    }
}
