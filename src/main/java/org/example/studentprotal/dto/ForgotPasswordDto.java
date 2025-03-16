package org.example.studentprotal.dto;

public class ForgotPasswordDto {
    private String fullName;
    private String newPassword;

    // Getters and setters
    public String getFullName() {
        return fullName;
    }
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
    public String getNewPassword() {
        return newPassword;
    }
    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }
}
