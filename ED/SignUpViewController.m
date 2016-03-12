//
//  SignUpViewController.m
//  ED
//
//  Created by Manu on 3/11/16.
//  Copyright © 2016 manvitha. All rights reserved.
//

#import "SignUpViewController.h"
#import <KinveyKit/KinveyKit.h>
@interface SignUpViewController ()

@end

@implementation SignUpViewController
@synthesize username_signup;
@synthesize password_retype;
@synthesize password_signup;
- (void)viewDidLoad {
    [super viewDidLoad];
    username_signup.delegate=self;
    password_signup.delegate=self;
    password_retype.delegate=self;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(BOOL)textFieldShouldReturn:(UITextField*)textField
{
    NSInteger nextTag = textField.tag + 1;
    // Try to find next responder
    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder) {
        // Found next responder, so set it.
        [nextResponder becomeFirstResponder];
    } else {
        // Not found, so remove keyboard.
        [textField resignFirstResponder];
    }
    return NO; // We do not want UITextField to insert line-breaks.
}
- (IBAction)createAccount:(id)sender {
    if(password_signup.text==password_retype.text){
    [KCSUser userWithUsername:username_signup.text
                     password:password_signup.text
          withCompletionBlock:^(KCSUser *user, NSError *errorOrNil, KCSUserActionResult result) {
              if (errorOrNil == nil) {
                  //was successful!
                  NSLog(@"Successfully updated");
                  [self performSegueWithIdentifier:@"SignupToLogin" sender:self];
              } else {
                  //there was an error with the update save
                  NSString* message = [errorOrNil localizedDescription];
                  NSLog(@"Error with update");              }
          }];
    }
}
@end
