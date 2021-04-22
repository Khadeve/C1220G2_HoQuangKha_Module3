package model.service.impl;

import model.bean.RentType;
import model.bean.Service;
import model.bean.ServiceType;
import model.repository.RentTypeRepo;
import model.repository.ServiceRepo;
import model.repository.ServiceTypeRepo;
import model.repository.impl.RentTypeRepoImpl;
import model.repository.impl.ServiceRepoImpl;
import model.repository.impl.ServiceTypeRepoImpl;
import model.service.SerService;

import java.sql.Connection;
import java.util.List;

public class SerServiceImpl implements SerService {
    ServiceRepo serviceRepo = new ServiceRepoImpl();
    RentTypeRepo rentTypeRepo = new RentTypeRepoImpl();
    ServiceTypeRepo serviceTypeRepo = new ServiceTypeRepoImpl();

    @Override
    public boolean addNewService(Service newService) {
        newService.setId(newService.getId().substring(3));

        List<RentType> rentTypeList = rentTypeRepo.getRentTypeList();
        String rentType = newService.getRentType();
        for (RentType type : rentTypeList) {
            if (rentType.equals(type.getRentTypeName())) {
                newService.setRentType(type.getRentTypeId());
            }
        }

        List<ServiceType> serviceTypeList = serviceTypeRepo.getServiceTypeList();
        String serviceType = newService.getServiceType();
        for (ServiceType type : serviceTypeList) {
            if (serviceType.equals(type.getServiceTypeName())) {
                newService.setServiceType(type.getServiceTypeId());
            }
        }

        return serviceRepo.addNewService(newService);
    }
}
