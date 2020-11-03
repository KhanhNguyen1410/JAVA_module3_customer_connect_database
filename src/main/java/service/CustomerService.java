package service;

import model.Customer;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerService implements MyCustomerService{

    private static Map<Integer, Customer> customers;
    static {
        customers = new HashMap<>();
        customers.put(1,new Customer(1,"khanh","HT","khanh.jpg"));
        customers.put(2,new Customer(2,"toc nguoi","HT","toc.jpg"));
        customers.put(3,new Customer(3,"chi chau","HT","chau.jpg"));
        customers.put(4,new Customer(4,"tuan dan","HT","tuan.jpg"));
    }

    private String jdbcURL = "jdbc:mysql://localhost:3306/demoCustomer?useSSL=false";
    private String jdbcUsername="root";
    private String jdbcPassword = "MySQL1410";

    private static final String INSERT_USER_SQL = "INSERT INTO users" +
            "  ( name, address, image) VALUES " +" ( ?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "select id,name,address,image from users where id =?";
    private static final String SELECT_ALL_USERS = "select * from users";
    private static final String DELETE_USERS_SQL = "delete from users where id = ?;";
    private static final String UPDATE_USERS_SQL = "update users set name = ?,address= ?, image =? where id = ?;";

    protected Connection getConnection() {
        Connection connection = null;
        try {
           Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
//        System.out.println(connection);
        return connection;
    }





    @Override
    public void create(Customer customer) throws SQLException {
//        customers.put(customer.getId(), customer);
        System.out.println(INSERT_USER_SQL);
        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_SQL)) {
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getAddress());
            preparedStatement.setString(3, customer.getImage());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void edit(int id, Customer customer) {

//        customers.put(id,customer);
        Connection connection = getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);
            statement.setString(1,customer.getName());
            statement.setString(2,customer.getAddress());
            statement.setString(3,customer.getImage());
            statement.setInt(4, id);
            statement.executeUpdate();
        } catch (SQLException throwAbles) {
            throwAbles.printStackTrace();
        }
//        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);) {
//            statement.setString(1, customer.getName());
//            statement.setString(2, user.getEmail());
//            statement.setString(3, user.getCountry());
//            statement.setInt(4, user.getId());
    }

    @Override
    public void delete(int id) throws SQLException {
        Connection connection = getConnection();
        PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);
        statement.setInt(1,id);
        statement.executeUpdate();
    }

    @Override
    public Customer findById(int id) {

//        return customers.get(id);
        Customer customer = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID)) {
            preparedStatement.setInt(1,id);

            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String address = rs.getString("address");
                String image = rs.getString("image");
                customer = new Customer(id, name, address,image);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    @Override
    public List<Customer> findAll() {

//        return new ArrayList<>(customers.values());
        List<Customer> customers = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS)) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String address = rs.getString("address");
                String image = rs.getString("image");
                customers.add(new Customer(id, name, address,image ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
    }
    boolean checkId(int id){
        for (int i = 0; i < customers.size(); i++) {
            if (id== customers.get(i).getId()){
                return true;
            }
        }
        return false;
    }
}
