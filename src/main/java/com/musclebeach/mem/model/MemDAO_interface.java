package com.musclebeach.mem.model;

import java.sql.Date;
import java.util.List;

public interface MemDAO_interface {
    public void insert(MemVO memVO);

    public void update(MemVO memVO);

    public void delete(Integer memID);

    public MemVO findByPrimaryKey(Integer memID);

    public List<MemVO> findByName(String memName);

    public MemVO findByPhone(String memPhone);

    public MemVO findByBirthday(Date memBirthday);

    public MemVO checkAccount(String account);

    public List<MemVO> getAll();

    public Boolean updatePassWord(Integer memberId, String newPassWord);

    public void updateMemAccess(Integer memID);

    public void updateMembership(Integer memID);

    public void updateMemStatus(Integer memID);
}
