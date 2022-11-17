package com.example.muvin.domain.user;

import java.time.LocalDateTime;

import lombok.*;
import org.springframework.data.annotation.CreatedDate;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;


@Getter
@Setter
@NoArgsConstructor
public class UserDto {
    @NotBlank
    private String id; // PK
    @NotBlank
    @Pattern(regexp = "(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\W)(?=\\S+$).{8,16}", message = "비밀번호는 8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.")
    private String password;
    @NotBlank
    @Pattern(regexp = "(/^[가-힣]+$/)", message = "이름은 한글만 작성가능합니다.")
    private String name;
    @NotBlank
    @Pattern(regexp = "^[ㄱ-ㅎ가-힣a-z0-9-_]{2,10}$", message = "닉네임은 특수문자를 제외한 2~10자리여야 합니다.")
    private String nickname;
    @NotBlank
    @Pattern(regexp = "(01[016789])(\\d{3,4})(\\d{4})", message = "올바른 휴대폰 번호를 입력해주세요.")
    private String phone;
    private String birth;
    @NotBlank
    @Email(message = "이메일 형식이 올바르지 않습니다.")
    private String email;


    public  UserDto(User user){
        id = user.getId();
        password = user.getPassword();
        name = user.getName();
        nickname = user.getNickname();
        phone = user.getPhone();
        birth = user.getBirth();
        email = user.getEmail();
    }

    @Builder
    public UserDto(String id, String password, String name, String nickname, String phone, String birth, String email){
        this.id = id;
        this.password = password;
        this.name = name;
        this.nickname = nickname;
        this.phone = phone;
        this.birth = birth;
        this.email = email;
    }

    public User toEntity(){
        User user = User.builder()
                .id(id)
                .password(password)
                .name(name)
                .nickname(nickname)
                .phone(phone)
                .birth(birth)
                .email(email)
                .build();
        return user;
    }

}