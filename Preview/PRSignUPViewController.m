//
//  PRSignUPViewController.m
//  Preview
//
//  Created by SaiKiran Dasika on 10/05/14.
//  Copyright (c) 2014 Burst. All rights reserved.
//

#import "PRSignUPViewController.h"
#import <Parse/Parse.h>
#import <iAd/iAd.h>

@interface PRSignUPViewController ()

@end

@implementation PRSignUPViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}




- (IBAction)signUp:(id)sender {
    //We have to sign the user up here.
    NSString *usernameField = [self.usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *passwordField = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *emailField = [self.emailAddressField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *fullNameField = [self.fullNameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (usernameField == 0 || passwordField == 0 || emailField == 0) {
        //We have to show an alert View.
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Looks like you have missed some parameter" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alertView show];
    }
    
    else {
        //We can sign the user up sucessfully.
        PFUser *newUser = [PFUser user];
        newUser.username = usernameField;
        newUser.password = passwordField;
        newUser.email = emailField;
        newUser[@"fullName"] = fullNameField;
        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (error) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error 403" message:[error.userInfo objectForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alertView show];
            }
            else {
                //The user can now go to the home page.
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
        }];
        
    }

}

#pragma mark - Banner Methods
-(void)bannerViewDidLoadAd:(ADBannerView *)banner{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [banner setAlpha:1];
    [UIView commitAnimations];
}
-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [banner setAlpha:0];
    [UIView commitAnimations];
}

@end
