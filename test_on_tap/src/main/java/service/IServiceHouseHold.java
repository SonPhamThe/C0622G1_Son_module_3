package service;

import model.houseHold;
import model.member;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface IServiceHouseHold {
    List<houseHold> displayAll();

    Map<String,String> updateHouseHold(houseHold houseHold);

    houseHold findHouseHold(int id);

    Map<Integer, List<member>> getListHouseHold() throws SQLException;

    List<houseHold> searchHouseHold(String searchName, String searchDate, String searchAddress);

    Map<Integer, String> selectAllPosition();

    Map<Integer, String> selectAllEducationDegree();

    Map<Integer, String> selectAllDivision();

    List<houseHold> searchHouseHoldTwo(String searchName, String searchDate);

    List<houseHold> searchHouseHoldOne(String searchName);
}
