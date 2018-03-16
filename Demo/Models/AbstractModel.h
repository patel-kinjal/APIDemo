//
//  AbstractModel.h
//  Demo
//
//  Created by Kinjal on 15/03/18.
//  Copyright © 2018 Kinjal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AbstractModel : NSObject

+ (id) getModelFromDictionary:(NSDictionary *)dictionary;
+ (NSDictionary *) getDictionaryFromModel:(id)model;

@end
