package com.musclebeach.artLike.model;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ArtLikeService {
    @Resource
    private ArtLikeDAO_interface dao;

    public ArtLikeVO addArtLike(Integer artID, Integer memID) {

        ArtLikeVO artLikeVO = new ArtLikeVO();

        artLikeVO.setArtID(artID);
        artLikeVO.setMemID(memID);
        dao.insert(artLikeVO);

        return artLikeVO;
    }

    public void deleteArtLike(Integer artID, Integer memID) {
        dao.delete(artID, memID);
    }

    public List<ArtLikeVO> getAllArtLike(Integer artID) {
        return dao.getAllByArtID(artID);
    }

    public List<ArtLikeVO> getAll() {
        return dao.getAll();
    }
}