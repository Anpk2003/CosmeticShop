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
import model.Account;

/**
 *
 * @author Phung An
 */
public class DAOAccount extends DBContext {

    //authenication
//check login
    public Account checkAuthen(String email, String password) {
        String sql = "SELECT * FROM Account "
                + " where email=? and password =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt("id"), email, rs.getBoolean("isAdmin"), rs.getString("username"), password);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }
//hien tat ca account

    public List<Account> getAll() {
        List<Account> list = new ArrayList<>();
        String sql = "Select * from account";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account p = new Account(rs.getInt("id"), rs.getString("email"), rs.getBoolean("isAdmin"), rs.getString("username"), rs.getString("password"));
                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public Account getAccountByID(int id) {

        String sql = "SELECT * FROM account WHERE id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            //giá trị đầu tiên ở vị trí 1 thiết lập với id
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                 Account p = new Account(rs.getInt("id"), rs.getString("email"), rs.getBoolean("isAdmin"), rs.getString("username"), rs.getString("password"));
               return p;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public void removeAccount(int id) {
        int n = 0;
        String sql = "delete from Account where id = " + id + "and(" + id
                + "not in (select distinct account_id from Orders))";
        try {
            PreparedStatement state = connection.prepareStatement(sql);
            state.execute();
        } catch (SQLException ex) {
        }
    }
    //check account exits

    public Account checkAccountExist(String email) {
        String sql = "SELECT * from account where  email =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
          
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt("id"), email, rs.getBoolean("isAdmin"), rs.getString("username"), rs.getString("password"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    //ham sign up 
    public void singUp(String user, String pass,String email) {
        String sqlGetMaxId = "Select MAX(id) FROM Account";
        String sql = "INSERT INTO [dbo].[Account]\n"
                + "           ([id]\n"
                + "           ,[isAdmin]\n"
                + "           ,[username]\n"
                + "           ,[password]\n"
                + "           ,[email])\n"
                + "     VALUES (?,0,?,?,?)";
               
        try {
            PreparedStatement getMaxIdPre = connection.prepareStatement(sqlGetMaxId);
            ResultSet rs = getMaxIdPre.executeQuery();
            int maxId = 0;
            if (rs.next()) {
                maxId = rs.getInt(1);
            }
            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, maxId + 1);
            st.setString(2, user);
            st.setString(3, pass);
            st.setString(4, email);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

  public void change(Account a) {
    String sql = "UPDATE account SET password = ? WHERE id= ?";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, a.getPassword());
        st.setInt(2, a.getId());
        st.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();  // In ra chi tiết lỗi
    }
}
    public void changeName(Account a) {
    String sql = "UPDATE account SET username = ? WHERE id= ?";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, a.getUsername());
        st.setInt(2, a.getId());
        st.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();  // In ra chi tiết lỗi
    }
}

    public void changeAdmin(Account a) {
        String sql = "update account set isAdmin =? Where id =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            String admin = "1";
            if (!a.isIsAdmin()) {
                admin = "0";
            }
            st.setBoolean(1, a.isIsAdmin());
            //  st.setString(1, admin);
            st.setInt(2, a.getId());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public int CountUser() {
        int count = 0;
        String sql = "SELECT COUNT(*) as 'count'\n"
                + "  FROM Account where isAdmin = 'False' or isAdmin = 'FALSE' ";
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
        DAOAccount dao = new DAOAccount();
        List<Account> list = dao.getAll();
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).isIsAdmin() == true) {
                System.out.println(list.get(i).getUsername());
            }

        }
        System.out.println(list.get(0).getUsername());
        System.out.println(dao.CountUser());
        System.out.println(list.get(0).isIsAdmin());
    }
}
