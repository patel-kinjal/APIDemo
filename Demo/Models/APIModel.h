//
//  APIModel.h
//  Demo
//
//  Created by Kinjal on 15/03/18.
//  Copyright © 2018 Kinjal. All rights reserved.
//

#import "AbstractModel.h"

@interface APIModel : AbstractModel

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *sectionId;
@property (nonatomic, strong) NSString *sectionName;
@property (nonatomic, strong) NSString *webPublicationDate;
@property (nonatomic, strong) NSString *webTitle;
@property (nonatomic, strong) NSString *webUrl;
@property (nonatomic, strong) NSString *apiUrl;
@property (nonatomic, assign) BOOL isHosted;
@property (nonatomic, strong) NSString *pillarId;
@property (nonatomic, strong) NSString *pillarName;

+ (APIModel*) getModelFromDictionary:(NSDictionary *)dictionary;
+ (NSDictionary *) getDictionaryFromModel:(APIModel *)model;

@end
