//
//  Utils.m
//
#import <Foundation/Foundation.h>
#import "Utils.h"

@implementation Utils

+ (NSString *) replace:(NSString *)string replaceStringArgs:(NSArray *)args {
  
  NSError *regExpError = nil;
  NSString *pattern = @"\\{\\d+\\}";
  NSMutableString *finalResult = [string mutableCopy];
  
  NSRegularExpression *regExp = [NSRegularExpression regularExpressionWithPattern:pattern
                                                                          options: 0 error:&regExpError];
  NSMutableArray *wordAry = [NSMutableArray array];
  NSMutableArray *indexAry = [NSMutableArray array];
  
  [regExp enumerateMatchesInString:finalResult options:NSMatchingReportCompletion
                             range:NSMakeRange(0, [finalResult length]) usingBlock:
   ^(NSTextCheckingResult *results, NSMatchingFlags flags, BOOL *stop){
     if(results != nil) {
       NSString *word = [finalResult substringWithRange:
                         NSMakeRange(results.range.location,
                                     results.range.length)];
       [wordAry addObject:word];
       NSString *wordIndex = [word substringWithRange:NSMakeRange(1, [word length] - 2)];
       NSNumber *wordIndexInt = [NSNumber numberWithInt: wordIndex.intValue];
       [indexAry addObject:wordIndexInt];
     }
   }];
  
  if (wordAry.count > 0) {
    [wordAry enumerateObjectsUsingBlock:^(id obj, NSUInteger index, BOOL *stop) {
      if(args.count >= index) {
        NSNumber *replaceIndex = indexAry[index];
        NSString *replaceWord = [args objectAtIndex:replaceIndex.integerValue];
        [finalResult setString:[finalResult stringByReplacingOccurrencesOfString:obj
                                          withString:replaceWord
                                          options:NSLiteralSearch
                                          range:NSMakeRange(0, finalResult.length)]];
      }
    }];
  }
  return finalResult;
}

@end