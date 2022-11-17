//package com.example.muvin.entity;
//
//
//import com.example.muvin.domain.map.MapDto;
//import com.example.muvin.util.Timestamp;
//import lombok.*;
//
//import javax.persistence.Entity;
//import javax.persistence.Id;
//import javax.persistence.Table;
//import java.sql.Time;
//
//
//@Getter
//@Entity
//@Setter
//@NoArgsConstructor
//
//public class MapEntity extends Timestamp {
//
//
//    @Id
//    private String code; // PK
//    private double x;
//    private double y;
//    private java.sql.Timestamp regdate;
//    private String area_code;
//    private String area_name;
//    private String movie_code;
//
//    public MapEntity(MapDto mapDto){
//        this.code = mapDto.getCode();
//        this.x = mapDto.getX();
//        this.y = mapDto.getY();
//        this.regdate = mapDto.getRegdate();
//        this.area_code = mapDto.getArea_code();
//        this.area_name = mapDto.getArea_name();
//        this.movie_code = mapDto.getMovie_code();
//    }
//
//
//}
