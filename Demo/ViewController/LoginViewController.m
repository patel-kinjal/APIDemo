//
//  LoginViewController.m
//  Demo
//
//  Created by Kinjal on 15/03/18.
//  Copyright © 2018 Kinjal. All rights reserved.
//

#import "LoginViewController.h"
#import "DisplayViewController.h"

@interface LoginViewController ()

@property (strong, nonatomic) DisplayViewController *displayVC;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)proceedButtonTapped:(id)sender {
    
    self.displayVC = [[DisplayViewController alloc] initWithNibName:@"DisplayViewController" bundle:nil];
    [self presentViewController:self.displayVC animated:YES completion:NULL];
}

@end
