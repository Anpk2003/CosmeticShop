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
import model.OrderDetails;

/**
 *
 * @author Phung An
 */
public class DAOOrderDetails extends DBContext {

    public List<OrderDetails> getAll() {
        List<OrderDetails> list = new ArrayList<>();
        String sql = "Select * from order_details";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderDetails ods = new OrderDetails(rs.getInt("id"), rs.getInt("order_id"), rs.getInt("product_id"), rs.getDouble("price"), rs.getInt("num"), rs.getDouble("total_money"));
                list.add(ods);
            }
        } catch (SQLException e) {

        }
        return list;
    }
    //insert Orders

    public void insert(OrderDetails o) {
        String sql = "INSERT INTO [dbo].[Order_Details]\n"
                + "           ([id]\n"
                + "           ,[order_id]\n"
                + "           ,[product_id]\n"
                + "           ,[price]\n"
                + "           ,[num]\n"
                + "           ,[total_money])\n"
                + "     VALUES(?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, o.getId());
            st.setInt(2, o.getOrder_id());
            st.setInt(3, o.getProduct_id());
            st.setDouble(4, o.getPrice());
            st.setInt(5, o.getNum());
            st.setDouble(6, o.getTotal_money());

            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
//update orderdetails

    public void update(OrderDetails p) {
        String sql = "UPDATE [dbo].[Order_Details]\n"
                + "   SET "
                + "      [order_id] = ?\n"
                + "      ,[product_id] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[num] = ?\n"
                + "      ,[total_money] = ?\n"
                + " WHERE id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, p.getOrder_id());
            st.setInt(2, p.getProduct_id());
            st.setDouble(3, p.getPrice());
            st.setInt(4, p.getNum());
            st.setDouble(5, p.getTotal_money());
            st.setInt(6, p.getId());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    //delete orderdetails
    public void removeOrderDetails(int id) {
        String sql = "delete from Order_Details where id = " + id;
        try {
            PreparedStatement state = connection.prepareStatement(sql);
            state.execute();
        } catch (SQLException ex) {
        }
    }

    public int maxid() {
        String sql = "SELECT TOP 1 o.id FROM Order_Details o ORDER BY o.id DESC";

        try (PreparedStatement pre = connection.prepareStatement(sql); ResultSet resultSet = pre.executeQuery()) {

            if (resultSet.next()) {
                int maxid = resultSet.getInt(1);
                return maxid;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int CountBill() {
        int count = 0;
        String sql = "SELECT COUNT(num) AS soLuongSanPham\n"
                + "FROM Order_Details; ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            //st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return count;
    }

    public static void main(String[] args) {
        DAOOrderDetails d = new DAOOrderDetails();
        List<OrderDetails> od = d.getAll();
        System.out.println(od.get(0).getPrice());
        System.out.println(d.CountBill());
    }
}
