package model.service;

import model.bean.Customer;

import java.util.List;

public interface CustomerService {
    List<Customer> displayCustomerList();

    void addNewCustomer(Customer newCustomer);

    Customer findCustomerById(int id);

    void deleteCustomerById(int id);
}
