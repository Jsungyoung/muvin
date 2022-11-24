package com.example.muvin.domain.img_info;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "img_info")
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Img_info{
    @Id
    private int code;
    private long review_no;
    private String url;

    public Img_info(Img_infoDto infoDto){
        this.code = infoDto.getCode();
        this.review_no = infoDto.getReview_no();
        this.url = infoDto.getUrl();
    }


}
