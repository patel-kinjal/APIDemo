//
//  DetailViewController.h
//  Demo
//
//  Created by Kinjal on 15/03/18.
//  Copyright © 2018 Kinjal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@protocol DetailViewDelegate <NSObject>

@optional
-(void) dismissDetailViewForIndex:(NSInteger) index;

@end

@interface DetailViewController : UIViewController

@property (weak, nonatomic) id <DetailViewDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *websiteURLTextField;
@property (weak, nonatomic) IBOutlet WKWebView *webView;

@property (strong, nonatomic) NSString *webURL;
@property (assign, nonatomic) NSInteger selectedIndex;

@end
