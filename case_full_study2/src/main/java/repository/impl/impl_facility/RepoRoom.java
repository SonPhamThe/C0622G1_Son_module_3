package repository.impl.impl_facility;

import model.facility.Room;
import repository.IRepoRoom;

import java.util.ArrayList;
import java.util.List;

public class RepoRoom implements IRepoRoom {
    private static List<Room> rooms = new ArrayList<>();

    @Override
    public List<Room> displayAll() {
        return rooms;
    }

    @Override
    public void add(Room room) {
        rooms.add(room);
    }

    @Override
    public void update(Room room) {
        int index = rooms.indexOf(room);
        rooms.set(index, room);
    }

    @Override
    public void remove(String name) {
        for (Room room : rooms) {
            if (room.getName().equals(name)) {
                rooms.remove(room);
                break;
            }
        }
    }
}
