package model.service;

import model.bean.Customer;

import java.util.List;

public interface CustomerService {
    List<Customer> getCustomerList();

    boolean addNewCustomer(Customer newCustomer);

    public boolean isValidCustomerInput(String input, String regexString);

    Customer getCustomerById(String id);

    void updateCustomerById(String id, Customer newCustomer);

    void deleteCustomerById(String id);

    List<Customer> searchWithinIdNamePhonenumber(String searchData);
}
