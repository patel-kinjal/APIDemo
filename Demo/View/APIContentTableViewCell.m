//
//  APIContentTableViewCell.m
//  Demo
//
//  Created by Kinjal on 15/03/18.
//  Copyright © 2018 Kinjal. All rights reserved.
//

#import "APIContentTableViewCell.h"

@implementation APIContentTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)updateCell:(APIModel *)model {
 
    self.sectionNameLabel.text = model.sectionName;
    self.dateLabel.text = [model.webPublicationDate substringWithRange:NSMakeRange(0, 10)];
    self.webTitleLabel.text = model.webTitle;
}

@end
