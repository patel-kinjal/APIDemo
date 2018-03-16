#import "NSDictionary+ReplaceNULL.h"

@implementation NSDictionary (JRAdditions)

- (NSDictionary *)dictionaryByReplacingNullsWithStrings {
    const NSMutableDictionary *replaced = [self mutableCopy];
    const id nul = [NSNull null];
    const NSString *blank = @"";
    
    for(NSString *key in self) {
        const id object = [self objectForKey:key];
        if(object == nul || [object isKindOfClass:[NSNull class]]) {
            [replaced setObject:blank
                         forKey:key];
        }
    }
    
    return [replaced copy];
}
@end
