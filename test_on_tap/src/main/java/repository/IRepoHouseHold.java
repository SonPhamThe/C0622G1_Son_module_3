package repository;

import model.houseHold;
import model.member;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface IRepoHouseHold {
    List<houseHold> displayAll();

    boolean update(houseHold houseHold);

    houseHold findHouseHold(int id);

    Map<Integer, List<member>> getListHouseHold() throws SQLException;
// cách của anh Quang
    List<houseHold> searchHouseHold(String searchName, String searchDate, String searchAddress);

    Map<Integer, String> selectAllPosition();

    Map<Integer, String> selectAllEducationDegree();

    Map<Integer, String> selectAllDivision();

    Map<Integer, String> findDivision();
}
