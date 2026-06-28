package com.xworkz.delegateOrganizer.encdecyPassword;

public interface PasswordEncoder {
    String encode(String password);
    String decrypt(String encryptedPassword);
    boolean match(String rawPassword, String encPassword);
}