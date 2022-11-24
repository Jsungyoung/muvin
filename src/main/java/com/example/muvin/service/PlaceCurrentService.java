package com.example.muvin.service;

import com.example.muvin.domain.place.PlaceRepository;
import com.example.muvin.domain.place_current.PlaceCurrent;
import com.example.muvin.domain.place_current.PlaceCurrent;
import com.example.muvin.domain.place_current.PlaceCurrentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class PlaceCurrentService {

    @Autowired
    private PlaceCurrentRepository repository;

    public void addPlaceCurrent(PlaceCurrent placeCurrent){
        repository.save(placeCurrent);
    }
    public List<PlaceCurrent> findMyPlaceAll(String userId){
        List<PlaceCurrent> result = repository.findByUserId(userId);
        return result;
    }
}
