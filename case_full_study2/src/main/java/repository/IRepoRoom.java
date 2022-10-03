package repository;

import model.facility.Room;
import model.facility.Villa;

import java.util.List;

public interface IRepoRoom {
    List<Room> displayAll();

    void add(Room room);

    void update(Room room);

    void remove(String name);
}
