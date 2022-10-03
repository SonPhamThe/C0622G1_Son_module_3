package service.impl.impl_facility;

import model.facility.Room;
import repository.IRepoRoom;
import repository.impl.impl_facility.RepoRoom;
import service.IServiceRoom;

import java.util.List;

public class ServiceRoom implements IServiceRoom {
    private static IRepoRoom roomRepo = new RepoRoom();

    @Override
    public List<Room> displayAll() {
        return roomRepo.displayAll();
    }

    @Override
    public void add(Room room) {
        roomRepo.add(room);
    }

    @Override
    public void update(Room room) {
        roomRepo.update(room);
    }

    @Override
    public void remove(String name) {
        roomRepo.remove(name);
    }
}
