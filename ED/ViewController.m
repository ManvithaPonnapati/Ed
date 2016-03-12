//
//  ViewController.m
//  ED
//
//  Created by Manu on 3/6/16.
//  Copyright © 2016 manvitha. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize username;
@synthesize password;
- (void)viewDidLoad {
    [super viewDidLoad];
    username.delegate=self;
    password.delegate=self;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
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
- (IBAction)Login:(id)sender {
    
    [KCSUser loginWithUsername:username.text password:password.text withCompletionBlock:^(KCSUser *user, NSError *errorOrNil, KCSUserActionResult result) {
        if (errorOrNil ==  nil) {
            [self performSegueWithIdentifier:@"LoginSuccess" sender:self];
        } else {
            //there was an error with the update save
            NSString* message = [errorOrNil localizedDescription];
                   }
    }];
}

- (IBAction)Signup:(id)sender {
}
@end
