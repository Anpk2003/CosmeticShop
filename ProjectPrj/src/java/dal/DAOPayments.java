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
import model.Payments;

/**
 *
 * @author Phung An
 */
public class DAOPayments extends DBContext {

    public List<Payments> getAll() {
        List<Payments> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[account_id]\n"
                + "      ,[order_id]\n"
                + "      ,[payment_date]\n"
                + "      ,[amount]\n"
                + "  FROM [dbo].[Payments]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Payments pa = new Payments(rs.getInt("id"), rs.getInt("account_id"), rs.getInt("order_id"), rs.getString("payment_date"), rs.getInt("amount"));
                list.add(pa);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    // insert category
    public void insert(Payments c) {
        String sql = "INSERT INTO [dbo].[Payments]\n"
                + "           ([id]\n"
                + "           ,[account_id]\n"
                + "           ,[order_id]\n"
                + "           ,[payment_date]\n"
                + "           ,[amount])\n"
                + "     VALUES(?,?,?,?,?) ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, c.getId());
            st.setInt(2, c.getAccount_id());
            st.setInt(3, c.getOrder_id());
            st.setString(4, c.getPayment_date());
            st.setDouble(5, c.getAmount());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    //update category
    public void update(Payments c) {
        String sql = "UPDATE [dbo].[Payments]\n"
                + "   SET"
                + "      [account_id] = ?\n"
                + "      ,[order_id] = ?\n"
                + "      ,[payment_date] =?\n"
                + "      ,[amount] =?\n"
                + " WHERE id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, c.getAccount_id());
            st.setInt(2, c.getOrder_id());
            st.setString(3, c.getPayment_date());
            st.setDouble(4, c.getAmount());
            st.setInt(5, c.getId());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
          // delete category
    public void removePayment(int id) {
        String sql = "delete from Payments where id = " + id ;
              
        try {
            PreparedStatement state = connection.prepareStatement(sql);
            state.execute();
        } catch (SQLException ex) {
        }
    }

    public static void main(String[] args) {
        DAOPayments d = new DAOPayments();
        List<Payments> od = d.getAll();
        System.out.println(od.get(0).getPayment_date());
    }
}
//kiem tra payment kieu du lieu cung voi xoa cua ode