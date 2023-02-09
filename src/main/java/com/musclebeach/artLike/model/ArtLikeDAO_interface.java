package com.musclebeach.artLike.model;

import java.util.List;

public interface ArtLikeDAO_interface {

    public void insert(ArtLikeVO artLikeVO);

    public void delete(Integer artID, Integer memID);

    public List<ArtLikeVO> getAll();

    public List<ArtLikeVO> getAllByArtID(Integer artID);

}