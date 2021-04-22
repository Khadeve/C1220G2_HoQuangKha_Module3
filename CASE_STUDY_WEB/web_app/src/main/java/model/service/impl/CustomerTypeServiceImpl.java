package model.service.impl;

import model.bean.CustomerType;
import model.repository.CustomerTypeRepo;
import model.repository.impl.CustomerTypeRepoImpl;
import model.service.CustomerTypeService;

import java.util.List;

public class CustomerTypeServiceImpl implements CustomerTypeService {
    CustomerTypeRepo customerTypeRepo = new CustomerTypeRepoImpl();

    @Override
    public List<CustomerType> getCustomerTypes() {
        return customerTypeRepo.getCustomerTypes();
    }
}
