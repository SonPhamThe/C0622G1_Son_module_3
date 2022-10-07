package repository.impl.impl_facility;

import model.facility.Room;
import repository.IRepoRoom;

import java.util.ArrayList;
import java.util.List;

public class RepoRoom implements IRepoRoom {
    private static List<Room> rooms = new ArrayList<>();

    static {
        rooms.add(new Room("Room", 50000, 50,35,"thuê phòng vip","tặng kèm bcs"));
        rooms.add(new Room("Room super", 60000, 60,95,"thuê 1 năm","tặng kèm hoa"));
        rooms.add(new Room("Room medium", 70000, 70,85,"thuê 1 tháng","tặng kèm đồ bơi"));
        rooms.add(new Room("Room 3 star", 80000, 80,75,"thuê 1 ngày","tặng kèm nước"));
        rooms.add(new Room("Room 4 star", 90000, 90,65,"thuê 1 tuần","tặng kèm bia"));
        rooms.add(new Room("Room  star", 40000, 20,55,"thuê vĩnh viễn","tặng kèm đồ ăn tối"));
        rooms.add(new Room("Room", 30000, 30,45,"thuê khi nào không thích thì trả","tặng kèm đồ ăn sáng"));
        rooms.add(new Room("Room", 30000, 30,45,"thuê khi nào không thích thì trả","tặng kèm đồ ăn sáng"));
        rooms.add(new Room("Room", 30000, 30,45,"thuê khi nào không thích thì trả","tặng kèm đồ ăn sáng"));
        rooms.add(new Room("Room", 30000, 30,45,"thuê khi nào không thích thì trả","tặng kèm đồ ăn sáng"));
        rooms.add(new Room("Room", 30000, 30,45,"thuê khi nào không thích thì trả","tặng kèm đồ ăn sáng"));
        rooms.add(new Room("Room", 30000, 30,45,"thuê khi nào không thích thì trả","tặng kèm đồ ăn sáng"));
        rooms.add(new Room("Room", 30000, 30,45,"thuê khi nào không thích thì trả","tặng kèm đồ ăn sáng"));
        rooms.add(new Room("Room", 30000, 30,45,"thuê khi nào không thích thì trả","tặng kèm đồ ăn sáng"));
        rooms.add(new Room("Room", 30000, 30,45,"thuê khi nào không thích thì trả","tặng kèm đồ ăn sáng"));
        rooms.add(new Room("Room", 30000, 30,45,"thuê khi nào không thích thì trả","tặng kèm đồ ăn sáng"));
        rooms.add(new Room("Room", 30000, 30,45,"thuê khi nào không thích thì trả","tặng kèm đồ ăn sáng"));
        rooms.add(new Room("Room", 30000, 30,45,"thuê khi nào không thích thì trả","tặng kèm đồ ăn sáng"));
        rooms.add(new Room("Room", 30000, 30,45,"thuê khi nào không thích thì trả","tặng kèm đồ ăn sáng"));
        rooms.add(new Room("Room", 30000, 30,45,"thuê khi nào không thích thì trả","tặng kèm đồ ăn sáng"));
        rooms.add(new Room("Room", 30000, 30,45,"thuê khi nào không thích thì trả","tặng kèm đồ ăn sáng"));
        rooms.add(new Room("Room", 30000, 30,45,"thuê khi nào không thích thì trả","tặng kèm đồ ăn sáng"));
    }

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
