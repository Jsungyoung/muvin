package com.example.muvin.domain.place;

import com.example.muvin.util.Timestamp;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "place")
@Entity
@NoArgsConstructor
@Getter
public class Place extends Timestamp{
    // pk
    @Id
    private int code; //pk
    private double x;
    private double y;

    @Column(name = "area_name")
    private String areaName;

    @Column(name = "movie_code")
    private String movieCode;

    @Column(name = "place_name")
    private String placeName;

    @Column(name = "place_url")
    private String placeURL;

    private int selmord;

    public Place(PlaceDto placeDto) {
        this.x = placeDto.getX();
        this.y = placeDto.getY();
        this.placeName = placeDto.getPlace_name();
        this.areaName = placeDto.getAreaName();
        this.movieCode = placeDto.getMovie_code();
        this.placeURL = placeDto.getPlace_URL();
        this.selmord = placeDto.getSelmord();
        System.out.println(this.placeURL);
        if(this.placeURL==null){
            this.placeURL = "https://postfiles.pstatic.net/20160402_264/maddara_1459606941333wgx8L_JPEG/Untitled-1.jpg?type=w1";
        }
    }
}
