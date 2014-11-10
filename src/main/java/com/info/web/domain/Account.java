package com.info.web.domain;

import org.apache.commons.lang.builder.ReflectionToStringBuilder;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.Size;
import java.io.Serializable;

/**
 * 계정 정보
 */
public class Account {

    public static final GuestUser GUEST_USER = new GuestUser();

    public static interface Login {}

    public static interface Join {}


    public Account() {
    }

    public Account(String email, String name) {
        this.email = email;
        this.name = name;
    }

    public Account(int id, String email, String name) {
        this.id = id;
        this.email = email;
        this.name = name;
    }


    // UserId
    private int id;

    private String name;

    private String email;

    private String reEmail;

    private String password;

    private String rePassword;
    // 권한
    private String authority;
    private String authority2;
    private String authority3;
    private String authority4;
    private String authority5;
    // 계정 활성화 (ENABLE / DISABLE)
    private String activation;

    private String authId;
    private String url;
    private String url2;
    private String url3;
    private String url4;
    private String url5;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public String getReEmail() {
        return reEmail;
    }
    public void setReEmail(String reEmail) {
        this.reEmail = reEmail;
    }

    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    public String getRePassword() {
        return rePassword;
    }
    public void setRePassword(String rePassword) {
        this.rePassword = rePassword;
    }

    public String getAuthority() {
        return authority;
    }
    public void setAuthority(String authority) {
        this.authority = authority;
    }
    public String getAuthority2() {
        return authority2;
    }
    public void setAuthority2(String authority2) {
        this.authority2 = authority2;
    }
    public String getAuthority3() {
        return authority3;
    }
    public void setAuthority3(String authority3) {
        this.authority3 = authority3;
    }
    public String getAuthority4() {
        return authority4;
    }
    public void setAuthority4(String authority4) {
        this.authority4 = authority4;
    }
    public String getAuthority5() {
        return authority5;
    }
    public void setAuthority5(String authority5) {
        this.authority5 = authority5;
    }

    public String getActivation() {
        return activation;
    }
    public void setActivation(String activation) {
        this.activation = activation;
    }
    public String getUrl() {
        return url;
    }
    public void setUrl(String url) {
        this.url = url;
    }
    public String getUrl2() {
        return url2;
    }
    public void setUrl2(String url2) {
        this.url2 = url2;
    }
    public String getUrl3() {
        return url3;
    }
    public void setUrl3(String url3) {
        this.url3 = url3;
    }
    public String getUrl4() {
        return url4;
    }
    public void setUrl4(String url4) {
        this.url4 = url4;
    }
    public String getUrl5() {
        return url5;
    }
    public void setUrl5(String url5) {
        this.url5 = url5;
    }
    public String getAuthId() {
        return authId;
    }
    public void setAuthId(String authId) {
        this.authId = authId;
    }


    public String toString() {
        return ReflectionToStringBuilder.toString(this);
    }

    public boolean isGuest() {
        return false;
    }

    public static class GuestUser extends Account {

        private GuestUser guestUser;
        private static final String GUEST = "GUEST";

        GuestUser() {
            guestUser = new GuestUser(1, "admin@nate.com", "관리자");
        }

        GuestUser(Integer id, String email, String name) {
            super(id, email, name);
        }


        public boolean isGuest() {
            return true;
        }

        public GuestUser getGuestUser() {
            return guestUser;
        }
    }
}
