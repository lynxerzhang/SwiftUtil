//
//  NSString+StringExtension.m
//

#import "NSString+StringExtension.h"

@implementation NSString (StringExtension)

- (NSString *)slice:(NSInteger)startIndex byEndIndex:(NSInteger)endIndex {
  NSString *str = @"";
  NSInteger start = startIndex, end = endIndex;
  NSUInteger count = [self length];
  if(start < 0) {
    if(start < -count) {
      start = -count;
    }
    start += count;
  }
  if(end < 0) {
    end += count;
  }
  else if(end > count) {
    end = count;
  }
  if(end >= start) {
    str = [self substringWithRange:NSMakeRange(start, end - start)];
  }
  return str;
}

- (NSString *)substr:(NSInteger)startIndex byLen:(NSInteger)len {
  NSString *str = @"";
  NSInteger start = startIndex, end = len;
  NSUInteger count = [self length];
  if(end > count){
    end = count;
  }
  if(start < 0) {
    if(start < -count) {
      start = -count;
    }
    start += count;
  }
  end += start;
  if (end > count) {
    end = count;
  }
  if(start < count) {
    str = [self substringWithRange:NSMakeRange(start, end - start)];
  }
  return str;
}

@end
