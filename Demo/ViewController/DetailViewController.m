//
//  DetailViewController.m
//  Demo
//
//  Created by Kinjal on 15/03/18.
//  Copyright © 2018 Kinjal. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () <WKUIDelegate, WKNavigationDelegate>

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView.UIDelegate = self;
    self.webView.navigationDelegate = self;
    
    [self configureUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)configureUI {
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    spinner.center = CGPointMake(160, 240);
    spinner.tag = 1;
    [self.view addSubview:spinner];
    [spinner startAnimating];
    
    self.websiteURLTextField.text = self.webURL;
    
    NSURL *url = [NSURL URLWithString:self.webURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (IBAction)cancelButtonTapped:(id)sender {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(dismissDetailViewForIndex:)]) {
        [self.delegate dismissDetailViewForIndex:self.selectedIndex];
    }
}

#pragma mark - Internal Methods

- (void)alertView:(NSString *)message withTitle:(NSString *)title onViewController:(UIViewController *)viewcontroller {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];
    [viewcontroller presentViewController:alertController animated:YES completion:nil];
}


#pragma mark - WKWebView Delegate Methods

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    
    [[self.view viewWithTag:1] stopAnimating];
    [self alertView:@"No Interent connection / Incorrect URL" withTitle:@"Error" onViewController:self];
    return;
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    
    [[self.view viewWithTag:1] stopAnimating];
}

@end
