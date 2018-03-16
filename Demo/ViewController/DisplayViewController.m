//
//  DisplayViewController.m
//  Demo
//
//  Created by Kinjal on 15/03/18.
//  Copyright © 2018 Kinjal. All rights reserved.
//

#import "DisplayViewController.h"
#import "APIContentTableViewCell.h"
#import "APIModel.h"
#import "DetailViewController.h"

@interface DisplayViewController () <UITableViewDelegate, UITableViewDataSource, DetailViewDelegate>

@property (strong, nonatomic) NSMutableArray *responseArray;
@property (strong, nonatomic) DetailViewController *detailVC;

@end

@implementation DisplayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self callAPI];
    [self setUp];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
}

- (void)setUp {
    
    UINib *nib = [UINib nibWithNibName:@"APIContentTableViewCell" bundle:nil];
    [self.contentTableView registerNib:nib forCellReuseIdentifier:@"APIContentTableViewCell"];
    self.contentTableView.dataSource = self;
    self.contentTableView.delegate = self;
    self.contentTableView.bounces = NO;
    self.contentTableView.backgroundColor = [UIColor clearColor];
    //self.contentTableView.separatorStyle = UITableViewCellStyleDefault;
}

- (void)callAPI {
    
    self.responseArray = [[NSMutableArray alloc] init];
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    spinner.center = CGPointMake(160, 240);
    spinner.tag = 1;
    [self.view addSubview:spinner];
    [spinner startAnimating];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURL *url = [NSURL URLWithString:@"https://content.guardianapis.com/search?q=seychelles&api-key=test"];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSDictionary *jsonDict = [[[NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error:nil] valueForKey:@"response"] valueForKey:@"results"];
        
        for (id model in jsonDict) {
            APIModel *api = [APIModel getModelFromDictionary:model];
            [self.responseArray addObject:api];
        }
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            [[self.view viewWithTag:1] stopAnimating];
            [self.contentTableView reloadData];
        });
        
    }] resume];
}

#pragma mark - Table View Delegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.responseArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * identifier = @"APIContentTableViewCell";
    APIContentTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"APIContentTableViewCell" owner:self options:nil];
        cell = [topLevelObjects objectAtIndex:0];
        [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
        cell.layer.shadowColor = [[UIColor blackColor] CGColor];
        cell.layer.shadowRadius = 5;
    }
    
    [cell updateCell:[self.responseArray objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    APIContentTableViewCell *cell = [self.contentTableView cellForRowAtIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor colorWithRed:239/255.0 green:239/255.0 blue:244/255.0 alpha:1]];
    
    //    self.detailVC = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    //    self.detailVC.webURL = [[self.responseArray objectAtIndex:indexPath.row] valueForKey:@"webUrl"];
    //    self.detailVC.selectedIndex = indexPath.row;
    //    self.detailVC.delegate = self;
    //    [self presentViewController:self.detailVC animated:YES completion:NULL];
    
    if (self.detailVC != nil) {
        [self.detailVC removeFromParentViewController];
        [self.detailVC.view removeFromSuperview];
        self.detailVC = nil;
    }
    
    self.detailVC = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    self.detailVC.webURL = [[self.responseArray objectAtIndex:indexPath.row] valueForKey:@"webUrl"];
    self.detailVC.selectedIndex = indexPath.row;
    self.detailVC.delegate = self;
    
    [self.view addSubview:self.detailVC.view];
    
    //    [self.detailVC.view autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    //    [self.detailVC.view autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    //    [self.detailVC.view autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    //    [self.detailVC.view autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
    //    [self.view layoutIfNeeded];

    [self addChildViewController:self.detailVC];
}

#pragma mark - External Delegate Methods

-(void) dismissDetailViewForIndex:(NSInteger) index {
    
    [self.detailVC removeFromParentViewController];
    [self.detailVC.view removeFromSuperview];
    self.detailVC = nil;
}

@end
