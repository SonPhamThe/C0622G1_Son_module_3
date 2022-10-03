package repository.impl.impl_facility;

import model.facility.House;
import repository.IRepoHouse;

import java.util.ArrayList;
import java.util.List;

public class RepoHouse implements IRepoHouse {
    private static List<House> houses = new ArrayList<>();

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
