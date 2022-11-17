package com.example.muvin.domain.user;

import com.example.muvin.util.Timestamp;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;



@Table(name = "user")
@Entity
@NoArgsConstructor // 기본 생성자
@Getter
public class User extends Timestamp {

    @Id
    private String id; // PK
    private String password;
    private String name;
    private String nickname;
    private String phone;
    private String birth;
    private String email;


    public User(UserDto userDto){
        this.id = userDto.getId();
        this.password = userDto.getPassword();
        this.name = userDto.getName();
        this.nickname = userDto.getNickname();
        this.phone = userDto.getPhone();
        this.birth = userDto.getBirth();
        this.email = userDto.getEmail();
    }

    @Builder
    public User(String id, String password, String name, String nickname, String phone, String birth, String email){
        this.id = id;
        this.password = password;
        this.name = name;
        this.nickname = nickname;
        this.phone = phone;
        this.birth = birth;
        this.email = email;
    }
}

