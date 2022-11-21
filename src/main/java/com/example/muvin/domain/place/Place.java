package com.example.muvin.domain.place;

import com.example.muvin.util.Timestamp;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "place")
@Entity
@NoArgsConstructor
@Getter
public class Place extends Timestamp{
    @Id
    private String code; //pk
    private double x;
    private double y;
    private String area_name;
    private String movie_code;
    private String place_name;
    private String place_URL;



    public Place(PlaceDto placeDto){
        this.code = placeDto.getCode();
        this.x = placeDto.getX();
        this.y = placeDto.getY();
        this.area_name = placeDto.getArea_name();
        this.movie_code = placeDto.getMovie_code();
    }
}
