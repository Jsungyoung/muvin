package com.example.muvin.domain.img_info;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Setter
public class Img_infoDto {

    private int code;
    private long review_no;
    private String url;


    public Img_infoDto(int code, long review_no){

        this.code = code;
        this.review_no = review_no;
    }

}
