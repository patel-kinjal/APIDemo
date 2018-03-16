//
//  APIModel.m
//  Demo
//
//  Created by Kinjal on 15/03/18.
//  Copyright © 2018 Kinjal. All rights reserved.
//

#import "APIModel.h"
#import "NSObject+Extension.h"

@implementation APIModel

+ (APIModel*) getModelFromDictionary:(NSDictionary *)dictionary {
    
    APIModel *model = [[APIModel alloc] init];
    NSDictionary *mapping = [model propertiesDictionary];
    
    for (NSString *attribute in [mapping allKeys]) {
        
        NSString *attributeValue = [dictionary objectForKey:attribute];
        
        if (attributeValue!=nil &&!([attributeValue isKindOfClass:[NSNull class]]))
        {
            [model setValue:attributeValue forKeyPath:attribute];
        }
    }
    
    return model;
}

+ (NSDictionary *) getDictionaryFromModel:(APIModel *)model {
    
    return [model propertiesDictionary];
}

@end
