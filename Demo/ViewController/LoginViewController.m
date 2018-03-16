//
//  LoginViewController.m
//  Demo
//
//  Created by Kinjal on 15/03/18.
//  Copyright © 2018 Kinjal. All rights reserved.
//

#import "LoginViewController.h"
#import "DisplayViewController.h"

@interface LoginViewController () <UITextFieldDelegate>

@property (strong, nonatomic) DisplayViewController *displayVC;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchTextField.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)proceedButtonTapped:(id)sender {
    
    [self.view endEditing:YES];

    self.displayVC = [[DisplayViewController alloc] initWithNibName:@"DisplayViewController" bundle:nil];
    self.displayVC.searchString = self.searchTextField.text;
    [self presentViewController:self.displayVC animated:YES completion:NULL];
}

#pragma mark - UITextField Delegate Methods

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self.searchTextField resignFirstResponder];
    return YES;
}

@end
