package model.repository;

import model.bean.Customer;

import java.util.List;

public interface CustomerRepo {

    List<Customer> getCustomerList();

    boolean addNewCustomer(Customer newCustomer);

    Customer getCustomerById(String id);

    void updateCustomerById(String id, Customer newCustomer);

    void deleteCustomerById(String id);

    List<Customer> searchWithinIdNamePhonenumber(String searchData);
}
