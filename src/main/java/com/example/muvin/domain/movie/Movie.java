package com.example.muvin.domain.movie;

import com.example.muvin.util.Timestamp;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.time.LocalDateTime;
import java.util.Date;

@Table(name = "movie")
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
public class Movie  extends Timestamp {

    @Id
    private int code;
    private String userId;
    private String contentId;
    private String contentType;
    private String type;

    public Movie(MovieDto movieDto){
        this.code = movieDto.getCode();
        this.userId = movieDto.getUserId();
        this.contentId = movieDto.getContentId();
        this.contentType = movieDto.getContentType();
        this.type = movieDto.getType();
    }


}
