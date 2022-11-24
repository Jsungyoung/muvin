package com.example.muvin.domain.place;

import com.example.muvin.util.Timestamp;
import com.fasterxml.jackson.annotation.JsonAutoDetect;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "place")
@Entity
@NoArgsConstructor
@Getter
@JsonAutoDetect
public class Place extends Timestamp{
    @Id
    private int code; //pk
    private double x;
    private double y;
    private String area_name;
    private String movie_code;
    private String place_name;
    private String place_URL;
    private int selmord;



    public Place(PlaceDto placeDto) {
        this.x = placeDto.getX();
        this.y = placeDto.getY();
        this.place_name = placeDto.getPlace_name();
        this.area_name = placeDto.getArea_name();
        this.movie_code = placeDto.getMovie_code();
        this.place_URL = placeDto.getPlace_URL();
        this.selmord = placeDto.getSelmord();
        System.out.println(this.place_URL);
        if(this.place_URL==null){
            this.place_URL = "https://postfiles.pstatic.net/20160402_264/maddara_1459606941333wgx8L_JPEG/Untitled-1.jpg?type=w1";
        }
    }
}
