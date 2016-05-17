//
//  Utils.h
//
#ifndef Utils_h
#define Utils_h

#import <Foundation/Foundation.h>

@interface Utils : NSObject

+ (nonnull NSString *)replace:(nonnull NSString *)string
            replaceStringArgs:(nonnull NSArray *)args;

+ (nonnull NSString *)trim:(nonnull NSString *)string;

+ (nonnull NSString *)trimHead:(nonnull NSString *)string;

+ (nonnull NSString *)trimTail:(nonnull NSString *)string;

+ (nonnull NSString *)replaceByString:(nonnull NSString *)str
                          withPattern:(nonnull NSString *)pattern
                          replaceWith:(nonnull NSString *)replaceText;

@end

#endif /* Utils_h */

