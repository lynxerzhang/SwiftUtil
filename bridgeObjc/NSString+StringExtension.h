//
//  NSString+StringExtension.h
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (StringExtension)

- (NSString *)slice:(NSInteger)startIndex byEndIndex:(NSInteger)endIndex;
- (NSString *)substr:(NSInteger)startIndex byLen:(NSInteger)len;

@end

NS_ASSUME_NONNULL_END