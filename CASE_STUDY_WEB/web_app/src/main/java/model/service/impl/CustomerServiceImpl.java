package model.service.impl;

import model.bean.Customer;
import model.bean.CustomerType;
import model.repository.CustomerRepo;
import model.repository.CustomerTypeRepo;
import model.repository.impl.CustomerRepoImpl;
import model.repository.impl.CustomerTypeRepoImpl;
import model.service.CustomerService;
import model.service.common.CustomerInputValidation;
import model.service.common.InputValidation;

import java.util.ArrayList;
import java.util.List;

public class CustomerServiceImpl implements CustomerService {
    CustomerRepo customerRepo = new CustomerRepoImpl();
    CustomerTypeRepo customerTypeRepo = new CustomerTypeRepoImpl();

    @Override
    public List<Customer> getCustomerList() {
        List<Customer> customerList = customerRepo.getCustomerList();
        for (Customer customer : customerList) {
            if (customer.getGender().equals("1")) {
                customer.setGender("male");
            } else {
                customer.setGender("female");
            }

            List<CustomerType> customerTypeList = customerTypeRepo.getCustomerTypes();
            String customerType = customer.getCustomerType();
            for (CustomerType type : customerTypeList) {
                if (customerType.equals(String.valueOf(type.getId()))) {
                    customer.setCustomerType(type.getCustomerType());
                    break;
                }
            }
        }
        return customerList;
    }

    @Override
    public boolean addNewCustomer(Customer newCustomer) {
        newCustomer.setId(newCustomer.getId().substring(3));

        List<CustomerType> customerTypeList = customerTypeRepo.getCustomerTypes();
        String customerType = newCustomer.getCustomerType();
        for (CustomerType type : customerTypeList) {
            if (customerType.equals(type.getCustomerType())) {
                newCustomer.setCustomerType(String.valueOf(type.getId()));
            }
        }

        String[] birthdayTokens = newCustomer.getDateOfBirth().split("/");
        newCustomer.setDateOfBirth(String.join("-", birthdayTokens[2], birthdayTokens[1], birthdayTokens[0]));

        String gender = newCustomer.getGender();
        if (gender.equals("male")) {
            newCustomer.setGender("true");
        } else {
            newCustomer.setGender("false");
        }

        return customerRepo.addNewCustomer(newCustomer);
    }

    @Override
    public boolean isValidCustomerInput(String input, String regexString) {
        return CustomerInputValidation.isValidCustomerInput(input, regexString);
    }

    @Override
    public Customer getCustomerById(String id) {
        Customer updatedCustomer = customerRepo.getCustomerById(id);
        if (updatedCustomer.getGender().equals("1")) {
            updatedCustomer.setGender("male");
        } else {
            updatedCustomer.setGender("female");
        }

        String[] dateParts = updatedCustomer.getDateOfBirth().split("-");
        String birthday = String.join("/", dateParts[2], dateParts[1], dateParts[0]); // format: dd/mm/yyyy
        updatedCustomer.setDateOfBirth(birthday);

        List<CustomerType> customerTypeList = customerTypeRepo.getCustomerTypes();
        String customerType = updatedCustomer.getCustomerType();

        for (CustomerType type : customerTypeList) {
            if (customerType.equals(String.valueOf(type.getId()))) {
                updatedCustomer.setCustomerType(type.getCustomerType());
                break;
            }
        }
        return updatedCustomer;
    }

    @Override
    public void updateCustomerById(String id, Customer newCustomer) {
        String gender = newCustomer.getGender();
        if (gender.equals("male")) {
            newCustomer.setGender("true");
        } else {
            newCustomer.setGender("false");
        }

        String[] birthdayTokens = newCustomer.getDateOfBirth().split("/");
        newCustomer.setDateOfBirth(String.join("-", birthdayTokens[2], birthdayTokens[1], birthdayTokens[0]));

        List<CustomerType> customerTypeList = customerTypeRepo.getCustomerTypes();
        String customerType = newCustomer.getCustomerType();
        for (CustomerType type : customerTypeList) {
            if (customerType.equals(type.getCustomerType())) {
                newCustomer.setCustomerType(String.valueOf(type.getId()));
                break;
            }
        }
        customerRepo.updateCustomerById(id, newCustomer);
    }

    @Override
    public void deleteCustomerById(String id) {
        id = id.substring(3);
        customerRepo.deleteCustomerById(id);
    }

    @Override
    public List<Customer> searchWithinIdNamePhonenumber(String searchData) {
        return customerRepo.searchWithinIdNamePhonenumber(searchData);
    }
}
