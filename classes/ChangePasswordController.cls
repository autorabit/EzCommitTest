/**
 * An apex page controller that exposes the change password functionality
 */
public with sharing class ChangePasswordController {

////tags
//tags

    public String oldPassword {get; set;}
    public String newPassword {get; set;}
    public String verifyNewPassword {get; set;}   
    public String verifyEmail {get; set;}      
    
    // some changes are done here
    public PageReference changePassword() {
        return Site.changePassword(newPassword, verifyNewPassword, oldpassword);    
    }     
    
    public ChangePasswordController() {}
}