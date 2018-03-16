
#import <Foundation/Foundation.h>

@interface NSString (utility) 

-(BOOL) isStringPresent;
-(BOOL) isBlank;
-(BOOL) contains:(NSString *)string;

-(NSArray *)  splitOnChar:(char)ch;
-(NSString *) substringFrom:(NSInteger)from to:(NSInteger)to;
-(NSString *) stringByStrippingWhitespace;
-(NSInteger)  indexOfString: (NSString *) str;
-(NSInteger)  lastIndexOfString:(NSString *) str;
+(NSString*)  getNotNullString:(NSString*)str;
@end
