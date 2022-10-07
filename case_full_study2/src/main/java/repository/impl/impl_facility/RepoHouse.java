package repository.impl.impl_facility;

import model.facility.House;
import repository.IRepoHouse;

import java.util.ArrayList;
import java.util.List;

public class RepoHouse implements IRepoHouse {
    private static List<House> houses = new ArrayList<>();
//    String name, double area, double cost, int max_people, String rent_type, String standard_room, String description_other_convenience, int number_of_floors
    static {
        houses.add(new House("House",36363,7890,45,"thuê 1 năm","3 star","gần biển", 3));
        houses.add(new House("House Vip",4363,2890,55,"thuê 1 tuần","4 star","có hồ bơi", 4));
        houses.add(new House("House Medium",56363,3890,65,"thuê 1 ngày","5 star","có bếp nướng", 5));
        houses.add(new House("House 3 star",66363,4890,15,"thuê 1 tháng","6 star","có sân vườn", 6));
        houses.add(new House("House 5 star",76363,5890,25,"thuê 1 giờ","7 star","có bàn uống coffee", 7));
        houses.add(new House("House 4 star",86363,6890,35,"thuê 1 giây","8 star","có phòng xông bồn", 8));
        houses.add(new House("House 2 star",96363,8890,75,"thuê 5 phút","9 star","có máy nước nóng ", 9));
        houses.add(new House("House 1 star",26363,9890,85,"thuê 10 giờ","2 star","có điều hòa", 2));
    }

    @Override
    public List<House> displayAll() {
        return houses;
    }

    @Override
    public void add(House house) {
        houses.add(house);
    }

    @Override
    public void update(House house) {
        int index = houses.indexOf(house);
        houses.set(index, house);
    }

    @Override
    public void remove(String name) {
        for (House house : houses) {
            if (house.getName().equals(name)) {
                houses.remove(house);
                break;
            }
        }
    }
}
