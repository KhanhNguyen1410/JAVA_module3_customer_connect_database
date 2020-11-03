package service;

import model.Customer;

import java.sql.SQLException;
import java.util.List;

public interface MyCustomerService {
    void create(Customer customer) throws SQLException;
    void edit(int id,Customer customer);
    void delete(int id) throws SQLException;
    Customer findById(int id);
    List<Customer> findAll();
}
