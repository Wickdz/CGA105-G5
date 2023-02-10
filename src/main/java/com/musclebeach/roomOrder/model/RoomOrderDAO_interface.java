package com.musclebeach.roomOrder.model;

import java.util.List;

public interface RoomOrderDAO_interface {
    void insert(RoomOrderVO roomOrderVO);

    void update(RoomOrderVO roomOrderVO);

    void delete(Integer orderID);

    RoomOrderVO findByPrimaryKey(Integer orderID);

    List<RoomOrderVO> getAll();

}
