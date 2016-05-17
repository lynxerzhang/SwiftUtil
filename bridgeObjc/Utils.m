//
//  Utils.m
//
#import <Foundation/Foundation.h>
#import "Utils.h"

@implementation Utils

+ (NSString *)replace:(NSString *)string replaceStringArgs:(NSArray *)args {
  
  NSError *regExpError = nil;
  NSString *pattern = @"\\{\\d+\\}";
  NSMutableString *finalResult = [string mutableCopy];
  
  NSRegularExpression *regExp = [NSRegularExpression regularExpressionWithPattern:pattern
                                                                          options: 0 error:&regExpError];
  if(regExp != nil && regExpError == nil) {
    
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
  }
  return finalResult;
}

+ (NSString *)trim:(NSString *)string {
  NSCharacterSet *spaceSet = [NSCharacterSet whitespaceCharacterSet];
  NSString *trimmed = [string stringByTrimmingCharactersInSet:spaceSet];
  return trimmed;
}

+ (NSString *)trimHead:(NSString *)string {
  return [self replaceByString:string withPattern:@"^\\s+" replaceWith:@""];
}

+ (NSString *)trimTail:(NSString *)string {
  return [self replaceByString:string withPattern:@"\\s+$" replaceWith:@""];
}

+ (NSString *)replaceByString:(NSString *)str
                  withPattern:(NSString *)pattern
                  replaceWith:(NSString *)replaceText {
  NSMutableString *result = [str mutableCopy];
  NSError *regExpError = nil;
  NSRegularExpression *patterns = [NSRegularExpression regularExpressionWithPattern:pattern
                                                                            options:0
                                                                              error:&regExpError];
  if (patterns != nil && regExpError == nil) {
    [result setString:[patterns stringByReplacingMatchesInString:str
                                                         options:0
                                                           range:NSMakeRange(0, str.length)
                                                    withTemplate:replaceText]];
  }
  return result;
}
@end