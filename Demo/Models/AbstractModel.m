//
//  AbstractModel.m
//  Demo
//
//  Created by Kinjal on 15/03/18.
//  Copyright © 2018 Kinjal. All rights reserved.
//

#import "AbstractModel.h"
#import "NSDictionary+ReplaceNULL.h"
#import "NSObject+Extension.h"

@implementation AbstractModel

+ (id) getModelFromDictionary:(NSDictionary *)dictionary {
    
    dictionary = [dictionary dictionaryByReplacingNullsWithStrings];
    
    Class class = [self class];
    id model = [[class alloc] init];
    
    NSDictionary *mapping = [model propertiesDictionary];
    
    for (NSString *attribute in [mapping allKeys]) {
        
        NSString *attributeValue = [dictionary objectForKey:attribute];
        
        if (attributeValue!=nil &&!([attributeValue isKindOfClass:[NSNull class]])) {
            [model setValue:attributeValue forKeyPath:attribute];
        }
    }
    
    return model;
}

+ (NSDictionary *) getDictionaryFromModel:(id)model {
    
    return [model propertiesDictionary];
}

@end
