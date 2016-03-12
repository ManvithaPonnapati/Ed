//
//  SignUpViewController.h
//  ED
//
//  Created by Manu on 3/11/16.
//  Copyright © 2016 manvitha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *username_signup;

@property (weak, nonatomic) IBOutlet UITextField *password_signup;
@property (weak, nonatomic) IBOutlet UITextField *password_retype;
- (IBAction)createAccount:(id)sender;
@end
