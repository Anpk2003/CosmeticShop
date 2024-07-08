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
import model.Brand;

/**
 *
 * @author Phung An
 */
public class DAOBrand extends DBContext {
// hien brand
    public List<Brand> getAll() {
        List<Brand> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[Brand]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Brand b = new Brand(rs.getInt("id"), rs.getString("name"));
                list.add(b);
            }
        } catch (SQLException e) {
        }
        return list;
    }
        // insert Brand
    public void insert(Brand c) {
        String sql = "INSERT INTO [dbo].[Brand]\n"
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
        //update Brand
    public void update(Brand b) {
        String sql = "UPDATE [dbo].[Brand]\n"
                + "   SET"
                + "[name] = ?\n"
                + " WHERE id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, b.getName());
            st.setInt(2, b.getId());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
        // delete brand
    public void removeBrand(int id) {
        String sql = "delete from Brand where id = " + id + "and "
                + id + "not in (select distinct brand_id from Product)";
        try {
            PreparedStatement state = connection.prepareStatement(sql);
            state.execute();
        } catch (SQLException ex) {
        }
    }
}
