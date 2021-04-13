package model.repository.impl;

import model.bean.Customer;
import model.repository.CustomerRepo;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class CustomerRepoImpl implements CustomerRepo {

    private static Map<Integer, Customer> customers = new TreeMap<>();

    static {
        customers.put(221, new Customer(221, "Khang Ho", "khangHo@gmail.com", "Binh Dinh"));
        customers.put(146, new Customer(146, "Hoai Do", "hoaiDo@gmail.com", "Phuoc Loc"));
        customers.put(582, new Customer(582, "Kha Ho", "khaHo@gmail.com", "Tuy Phuoc"));
        customers.put(421, new Customer(421, "Ai Nu", "aiNu@gmail.com", "Da Nang"));
        customers.put(366, new Customer(366, "Nhan Truong", "nhanTruong@gmail.com", "Binh Dinh"));
    }

    @Override
    public List<Customer> displayCustomerList() {
        return new ArrayList<>(customers.values());
    }

    @Override
    public void addNewCustomer(Customer newCustomer) {
        customers.put(newCustomer.getId(), newCustomer);
    }

    @Override
    public Customer findCustomerById(int id) {
        return customers.get(id);
    }

    @Override
    public void deleteCustomerById(int id) {
        customers.remove(id);
    }
}
