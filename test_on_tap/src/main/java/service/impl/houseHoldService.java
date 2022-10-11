package service.impl;

import model.houseHold;
import model.member;
import repository.IRepoHouseHold;
import repository.impl.houseHoldRepo;
import service.IServiceHouseHold;
import validation.Validation;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class houseHoldService implements IServiceHouseHold {
    private static final IRepoHouseHold repoHouseHold = new houseHoldRepo();

    @Override
    public List<houseHold> displayAll() {
        return repoHouseHold.displayAll();
    }

    @Override
    public Map<String, String> updateHouseHold(houseHold houseHold) {
        Map<String, String> errorMap = new HashMap<>();

        if (houseHold.getName().equals("")) {
            errorMap.put("name", "Email không được để trống!");
        } else if (!Validation.checkName(houseHold.getName())) {
            errorMap.put("name", "Email không đúng định dạng");
        }

        if (houseHold.getStartDate().equals("")) {
            errorMap.put("starDate", "Name không được để trống!");
        }

        if (houseHold.getAddress().equals("")) {
            errorMap.put("address", "Address không được để trống!");
        }

        if (errorMap.size() == 0) {
            boolean check = repoHouseHold.update(houseHold);
        }

//        if (customer.getIdCard().equals("")) {
//            errorMap.put("idCard", "IdCard không được để trống!");
//        }
//        if (customer.getPhoneNumber().equals("")) {
//            errorMap.put("phoneNumber", "Phone không được để trống!");
//        } else if (!Validation.checkPhone(customer.getPhoneNumber())) {
//            errorMap.put("phoneNumber", "Phone không đúng định dạng (XX)-(0XXXXXXXXX)");
//        }
//        if (customer.getCustomerTypeId() == 100) {
//            errorMap.put("customerTypeId", "Customer Type không được để trống!");
//        }
//        if (customer.getGender() == 100) {
//            errorMap.put("gender", "Gender không được để trống!");
//        }
//        if (customer.getDateOfBirth().equals("")){
//            errorMap.put("dateOfBirth", "Date Of Birth không được để trống!");
//        } else {
//            int age = LocalDate.now().getYear() - LocalDate.parse(customer.getDateOfBirth()).getYear();
//            if (age < 18 || age > 100) {
//                errorMap.put("dateOfBirth", "Date Of Birth không hợp lệ (age>18 && age<100)");
//            }
//        }

        return errorMap;
    }

    @Override
    public houseHold findHouseHold(int id) {
        return repoHouseHold.findHouseHold(id);
    }

    @Override
    public Map<Integer, List<member>> getListHouseHold() throws SQLException {
        return repoHouseHold.getListHouseHold();
    }

    @Override
    public List<houseHold> searchHouseHold(String searchName, String searchDate, String searchAddress) {
        return repoHouseHold.searchHouseHold(searchName, searchDate, searchAddress);
    }

    @Override
    public Map<Integer, String> selectAllPosition() {
        return null;
    }

    @Override
    public Map<Integer, String> selectAllEducationDegree() {
        return null;
    }

    @Override
    public Map<Integer, String> selectAllDivision() {
        return null;
    }

    @Override
    public List<houseHold> searchHouseHoldTwo(String searchName, String searchDate) {
        return null;
    }

    @Override
    public List<houseHold> searchHouseHoldOne(String searchName) {
        return null;
    }
}
