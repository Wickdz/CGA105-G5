package com.musclebeach.news.model;

import java.util.List;
import java.util.Set;



public interface NewsDAO_interface {
	public void insert(NewsVO newsVO);
    public void update(NewsVO newsVO);
    public void delete(Integer newsID);
    public NewsVO findByPrimaryKey(Integer newsID );

    public List<NewsVO> getAll();
	public Set<NewsVO> getNewsByempID(Integer empID);
	public Set<NewsVO> getNewsByNewsTitle(String newsTitle);
}
