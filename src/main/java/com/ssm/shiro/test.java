package com.ssm.shiro;


import org.apache.shiro.crypto.hash.Md5Hash;

public class test {

    public static void main(String[] args) {
        String password = "12345";
        String encodedPassword = new Md5Hash(password).toString();

        System.out.println(encodedPassword);
    }
}