package com.example.muvin.service;

import com.example.muvin.domain.place.Place;
import com.example.muvin.domain.place.PlaceRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class PlaceService {

    //READ
    @Autowired
    private PlaceRepository repository;


    public List<Place> readPlaceList(String movie_code){
        return repository.findPlaceByMovie_code(movie_code);
    }



}