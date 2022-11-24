package com.example.muvin.domain.place_current;

import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "place_current")
@Entity
@NoArgsConstructor
@Getter
public class PlaceCurrent {

    @Id
    private int code;
    private String userId;
    private int placeNo;


    public PlaceCurrent(PlaceCurrentDto placeCurrentDto){
        this.code = placeCurrentDto.getCode();
        this.userId = placeCurrentDto.getUserId();
        this.placeNo = placeCurrentDto.getPlaceNo();
    }
}
