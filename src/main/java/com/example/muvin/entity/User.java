package com.example.muvin.entity;

import com.example.muvin.domain.user.UserDto;
import com.example.muvin.util.Timestamp;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "user")
@Entity
@NoArgsConstructor // 기본 생성자
@Getter
@Setter
public class User extends Timestamp { // VO (view only)

    @Id
    private String id; // PK
    private String password;
    private String name;
    private String nickname;
    private String phone;
    private String birth;
    private String email;

    public static User toSaveEntity(UserDto userDto){
        User user = new User();
        user.setPassword(userDto.getPassword());
        user.setName(userDto.getName());
        user.setNickname(userDto.getNickname());
        user.setPhone(userDto.getPhone());
        user.setBirth(userDto.getBirth());
        user.setEmail(userDto.getEmail());
        return user;
    }
}

