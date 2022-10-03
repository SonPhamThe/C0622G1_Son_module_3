package service;

import model.facility.Villa;

import java.util.List;

public interface IServiceVilla {
    List<Villa> displayAll();

    void add(Villa villa);

    void update(Villa villa);

    void remove(String name);
}
