package model.service.impl;

import model.bean.Customer;
import model.repository.CustomerRepo;
import model.repository.impl.CustomerRepoImpl;
import model.service.CustomerService;

import java.util.List;

public class CustomerServiceImpl implements CustomerService {
    private CustomerRepo customerRepo = new CustomerRepoImpl();

    @Override
    public List<Customer> displayCustomerList() {
        return this.customerRepo.displayCustomerList();
    }

    @Override
    public void addNewCustomer(Customer newCustomer) {
        customerRepo.addNewCustomer(newCustomer);
    }

    @Override
    public Customer findCustomerById(int id) {
        return customerRepo.findCustomerById(id);
    }

    @Override
    public void deleteCustomerById(int id) {
        customerRepo.deleteCustomerById(id);
    }
}
