
package model;

import java.io.Serializable;

public class Person implements Serializable
{
    private String fullname  = "";
    private String address   = "";
    private String email     = "";
    private String idCard    = "";
    private String phone     = "";
    private String gender    = "";
    private String birthday  = "";
    private String avatar    = null;
    
    public Person(String username) {
        this.fullname = username;
    }

    public Person(String fullname, String address, String email, String idCard,
        String phone, String gender, String birthday, String avatar)
    {
        this.fullname = fullname;
        this.address = address;
        this.email = email;
        this.idCard = idCard;
        this.phone = phone;
        this.gender = gender;
        this.birthday = birthday;
        this.avatar = avatar;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public String getIdCard() {
        return idCard;
    }

    public String getPhone() {
        return phone;
    }

    public String getGender() {
        return gender;
    }
    
    public String getBirthday() {
        return birthday;
    }

    public String getAvatar() {
        return avatar == null || avatar.isEmpty()
            ? "https://i.postimg.cc/MpwMyMKQ/profile.png" : avatar;
    }
}
