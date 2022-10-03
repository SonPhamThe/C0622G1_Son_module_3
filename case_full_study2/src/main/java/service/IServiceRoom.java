package service;

import model.facility.Room;

import java.util.List;

public interface IServiceRoom {
    List<Room> displayAll();

    void add(Room room);

    void update(Room room);

    void remove(String name);
}
