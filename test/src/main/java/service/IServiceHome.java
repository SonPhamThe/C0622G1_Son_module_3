package service;

import model.Home;

import java.util.List;

public interface IServiceHome {
    List<Home> displayAll();

    void add(Home home);
}
