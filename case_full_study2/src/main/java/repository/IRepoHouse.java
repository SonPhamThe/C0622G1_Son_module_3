package repository;

import model.facility.House;
import model.facility.Villa;

import java.util.List;

public interface IRepoHouse {
    List<House> displayAll();

    void add(House house);

    void update(House house);

    void remove(String name);
}
