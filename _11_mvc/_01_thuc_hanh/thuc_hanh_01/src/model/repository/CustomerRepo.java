package model.repository;

import model.bean.Customer;

import java.util.List;

public interface CustomerRepo {

    List<Customer> displayCustomerList();

    void addNewCustomer(Customer newCustomer);

    Customer findCustomerById(int id);

    void deleteCustomerById(int id);
}
