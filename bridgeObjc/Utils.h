//
//  Utils.h
//
#ifndef Utils_h
#define Utils_h

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Utils : NSObject

+ (NSString *)replace:(NSString *)string
            replaceStringArgs:(NSArray *)args;

+ (NSString *)trim:(NSString *)string;

+ (NSString *)trimHead:(NSString *)string;

+ (NSString *)trimTail:(NSString *)string;

+ (NSString *)replaceByString:(NSString *)str
                          withPattern:(NSString *)pattern
                          replaceWith:(NSString *)replaceText;

@end

#endif /* Utils_h */

NS_ASSUME_NONNULL_END