package service;

import model.facility.House;

import java.util.List;

public interface IServiceHouse {
    List<House> displayAll();

    void add(House house);

    void update(House house);

    void remove(String name);
}
