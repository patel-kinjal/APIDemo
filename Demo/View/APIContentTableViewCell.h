//
//  APIContentTableViewCell.h
//  Demo
//
//  Created by Kinjal on 15/03/18.
//  Copyright © 2018 Kinjal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APIModel.h"

@interface APIContentTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *sectionNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *webTitleLabel;

- (void)updateCell:(APIModel *)model;

@end
