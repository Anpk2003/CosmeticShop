/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Cart;
import model.Orders;

/**
 *
 * @author Phung An
 */
public class DAOOrders extends DBContext {
    //in ra tat ca orders

    public List<Orders> getAll() {
        List<Orders> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[account_id]\n"
                + "      ,[fullname]\n"
                + "      ,[email]\n"
                + "      ,[phone_number]\n"
                + "      ,[address]\n"
                + "      ,[note]\n"
                + "      ,[order_date]\n"
                + "      ,[status]\n"
                + "      ,[total_money]\n"
                + "  FROM [dbo].[Orders]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Orders o = new Orders(rs.getInt("id"), rs.getInt("account_id"), rs.getString("fullname"), rs.getString("email"), rs.getString("phone_number"), rs.getString("address"), rs.getString("note"), rs.getString("order_date"), rs.getInt("status"), rs.getDouble("total_money"));
                list.add(o);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public List<Orders> getOrderByAccount(int account) {
        List<Orders> list = new ArrayList<>();
        String sql = "Select * From Order Where 1=1";
           if (account != 0) {
            sql += " and account_id =" + account;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, account);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Orders o = new Orders(rs.getInt("id"), account, rs.getString("fullname"), rs.getString("email"), rs.getString("phone_number"), rs.getString("address"), rs.getString("note"), rs.getString("order_date"), rs.getInt("status"), rs.getDouble("total_money"));
                list.add(o);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    //add Order
    public void addOrder(Account u, Cart cart) {
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        try {
            String sql = "insert into [orders] VALUES(?,?,?,?,?,?,?,?,?,?)";
        } catch (Exception e) {
        }
    }
//insert Orders

    public void insert(Orders o) {
        String sql = "INSERT INTO [dbo].[Orders]\n"
                + "           ([id]\n"
                + "           ,[account_id]\n"
                + "           ,[fullname]\n"
                + "           ,[email]\n"
                + "           ,[phone_number]\n"
                + "           ,[address]\n"
                + "           ,[note]\n"
                + "           ,[order_date]\n"
                + "           ,[status]\n"
                + "           ,[total_money])\n"
                + "     VALUES(?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, o.getId());
            st.setInt(2, o.getAccount_id());
            st.setString(3, o.getFullname());
            st.setString(4, o.getEmail());
            st.setString(5, o.getPhone_number());
            st.setString(6, o.getAddress());
            st.setString(7, o.getNote());
            st.setString(8, o.getOrder_date());
            st.setInt(9, o.getStatus());
            st.setDouble(10, o.getTotal_money());

            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public int maxid() {
        String sql = "SELECT TOP 1 o.id FROM Orders o ORDER BY o.id DESC";

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
    //update

    public void update(Orders p) {
        String sql = "UPDATE [dbo].[Orders]\n"
                + "   SET"
                + "      [account_id] = ?\n"
                + "      ,[fullname] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[phone_number] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[note] = ?\n"
                + "      ,[order_date] = ?\n"
                + "      ,[status] = ?\n"
                + "      ,[total_money] = ?\n"
                + " WHERE id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, p.getAccount_id());
            st.setString(2, p.getFullname());
            st.setString(3, p.getEmail());
            st.setString(4, p.getPhone_number());
            st.setString(5, p.getAddress());
            st.setString(6, p.getNote());
            st.setString(7, p.getOrder_date());
            st.setInt(8, p.getStatus());
            st.setDouble(9, p.getTotal_money());
            st.setInt(10, p.getId());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
    // delete orders

    public void removeOrders(int id) {
        String sql = "delete from Orders where id = " + id + "and "
                + id + "not in (select distinct order_id from Order_details) and " + id + "not in (select distinct order_id from Payments)";
        try {
            PreparedStatement state = connection.prepareStatement(sql);
            state.execute();
        } catch (SQLException ex) {
        }
    }

    public List<Orders> getOrdersByID(int id) {
        List<Orders> list = new ArrayList<Orders>();
        String sql = "SELECT * FROM orders WHERE id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            //giá trị đầu tiên ở vị trí 1 thiết lập với id
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Orders o = new Orders(rs.getInt("id"), rs.getInt("account_id"), rs.getString("fullname"), rs.getString("email"), rs.getString("phone_number"), rs.getString("address"), rs.getString("note"), rs.getString("order_date"), rs.getInt("status"), rs.getDouble("total_money"));
                list.add(o);
                return list;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public int CountBill() {
        int count = 0;
        String sql = "SELECT COUNT(*) AS soLuongID\n"
                + "FROM orders; ";
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
        DAOOrders d = new DAOOrders();
        List<Orders> od = d.getAll();
        System.out.println(od.get(0).getEmail());
        System.out.println(d.maxid());
        System.out.println(od.get(4).getPhone_number());

    }
}
