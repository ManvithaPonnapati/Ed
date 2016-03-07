//
//  ViewController.h
//  ED
//
//  Created by Manu on 3/6/16.
//  Copyright © 2016 manvitha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
- (IBAction)Login:(id)sender;

- (IBAction)Signup:(id)sender;
@end

