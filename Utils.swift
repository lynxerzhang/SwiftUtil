//
//  Utils.swift
//
import UIKit

class Utils {
  
  class func replace(string: String, replaceStringArgs: [String]) -> String {
    var result = string
    do {
      let pattern = try NSRegularExpression(pattern: "\\{\\d+\\}", options: .CaseInsensitive)
      
      var wordAry:[String] = []
      var indexAry:[Int] = []
      
      pattern.enumerateMatchesInString(result,
                                       options: NSMatchingOptions.ReportCompletion,
            range: NSMakeRange(0, result.characters.count),
            usingBlock: { results, flags, point in
        
        if let matchResult = results {
          let word = result.substringWithRange(result.startIndex.advancedBy(matchResult.range.location)..<result.startIndex.advancedBy(matchResult.range.location + matchResult.range.length))
          wordAry.append(word)
          let wordIndex = word[word.startIndex.successor()..<word.endIndex.predecessor()]
          indexAry.append(Int(wordIndex)!)
        }
      })
      
      if !wordAry.isEmpty {
        for(index, word) in wordAry.enumerate() {
          if replaceStringArgs.count >= index {
            result = result.stringByReplacingOccurrencesOfString(word,
                                            withString: replaceStringArgs[indexAry[index]],
                                            options: NSStringCompareOptions.LiteralSearch, range: nil)
          }
        }
      }
    }
    catch {
    }
    return result
  }
  
  class func replaceByString(str: String, pattern: String, replaceWith: String) -> String {
    var result: String = str
    do {
      let patterns = try NSRegularExpression(pattern: pattern,
                                options: NSRegularExpressionOptions(rawValue: 0))
      result = patterns.stringByReplacingMatchesInString(str,
                                options: NSMatchingOptions(rawValue:0),
                                range: NSMakeRange(0, str.characters.count), withTemplate: replaceWith)
    }
    catch {
    }
    return result
  }
  
  class func stringToCharacter(str:String) ->[Character] {
    return Array(str.characters)
  }
  
  class func stringSplit(str:String, bySymbol: String = " ") -> [String] {
    return str.componentsSeparatedByString(bySymbol)
  }

  class func isMatch(str: String, pattern: String) -> Bool {
    var isMatch:Bool = false
    do {
      let regex = try NSRegularExpression(pattern: pattern, options: [.CaseInsensitive])
      let result = regex.firstMatchInString(str, options: NSMatchingOptions(rawValue: 0),
                                            range: NSMakeRange(0, str.characters.count))
      if (result != nil){
        isMatch = true
      }
    }
    catch {
      isMatch = false
    }
    return isMatch
  }
  
  //inspried from http://chrismontrois.net/2014/08/02/swift-techniques-strings/
  class func trim(string: String) -> String {
    let spaceSet = NSCharacterSet.whitespaceCharacterSet()
    let trimmed = string.stringByTrimmingCharactersInSet(spaceSet)
    return trimmed
  }
  
  //write by Matt Neuburg
  class func delay(delay: Double, closure:() -> ()) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC))),
                   dispatch_get_main_queue(), closure)
  }
  
  class func mutableTextFormat(txt: UITextField, locationLength: [Int: Int], color: [UIColor]) {
    if txt.text != nil {
      let d = NSMutableAttributedString(string: txt.text!)
      for (location) in locationLength.enumerate() {
        d.addAttribute(NSForegroundColorAttributeName, value: color[location.index],
                       range: NSRange(location: location.element.0, length: location.element.1))
      }
      txt.attributedText = d
    }
  }
  
  class func textContentIsDecimalDigit(txt: UITextField) -> Bool {
    let nonDecimal = NSCharacterSet.decimalDigitCharacterSet().invertedSet
    let str = txt.text
    let isNum = str?.stringByTrimmingCharactersInSet(nonDecimal).characters.count
      == str?.characters.count
    return isNum
  }
  
  class func textContentIsAlphanumeric(txt: UITextField) -> Bool {
    let nonAlphanumeric = NSCharacterSet.alphanumericCharacterSet().invertedSet
    let str = txt.text
    let isAlphanumeric = str?.stringByTrimmingCharactersInSet(nonAlphanumeric).characters.count
      == str?.characters.count
    return isAlphanumeric
  }
  
  class func retriveChineseCharacterCount(str: String) -> Int {
    var result = 0
    do {
      let regex = try NSRegularExpression(pattern: "[\\u4E00-\\u9FA5]",
                                          options: NSRegularExpressionOptions(rawValue: 0))
      let matchNum = regex.numberOfMatchesInString(str, options: NSMatchingOptions(rawValue: 0),
                                                 range: NSMakeRange(0, str.characters.count))
      result = matchNum
    }
    catch {
    }
    return result
  }
  
  /*
  *
  * @see
  * https://www.hackingwithswift.com/example-code/language/how-to-use-compiler-directives-to-detect-the-ios-simulator
  * http://themainthread.com/blog/2015/06/simulator-check-in-swift.html
  * https://forums.developer.apple.com/thread/13254
  *
  */
  /*
  class func isSimulator() -> Bool {
    var isSim = false
    #if arch(i386) || arch(x86_64)
    isSim = true
    #endif
    return isSim
  }
  */
  
  /*
  class func doTaskInBackground(closure: () -> ()) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)) {
      closure()
    }
  }
  
  class func doTaskInMainThread(closure: () -> ()) {
    dispatch_async(dispatch_get_main_queue()) {
      closure()
    }
  }
 */
}
