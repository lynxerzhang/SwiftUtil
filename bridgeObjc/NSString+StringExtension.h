//
//  NSString+StringExtension.h
//

#import <Foundation/Foundation.h>

@interface NSString (StringExtension)

- (nonnull NSString *)slice:(NSInteger)startIndex byEndIndex:(NSInteger)endIndex;
- (nonnull NSString *)substr:(NSInteger)startIndex byLen:(NSInteger)len;

@end
