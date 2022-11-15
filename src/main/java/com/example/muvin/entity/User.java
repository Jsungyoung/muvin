package com.example.muvin.entity;

import com.example.muvin.domain.user.UserDto;
import com.example.muvin.util.Timestamp;
import lombok.*;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "user")
@Entity
@AllArgsConstructor
@NoArgsConstructor // 기본 생성자
@Data
public class User extends Timestamp {

    @Id
    private String id; // PK
    private String password;
    private String name;
    private String nickname;
    private String phone;
    private String birth;
    private String email;

}

