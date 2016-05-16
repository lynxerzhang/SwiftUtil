//
//  Utils.swift
//
import UIKit

class Utils {
  
  /**
   格式化替换指定字符串
   - Parameter string: 指定文本对象
   - Parameter replaceStringArgs: 需要替换的字符串数组
   - Returns: 返回替换匹配后的字符串
   
   #### usage example
   ````
   // str equal 'helloworld'
   let str = Utils.replace("hello{0}or{1}d", ["w", "l"])
   ````
   */
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
                                                                 options: NSStringCompareOptions.LiteralSearch,
                                                                 range: nil)
          }
        }
      }
    }
    catch {
    }
    return result
  }
  
  /**
   替换正则表达式匹配的字符串
   - Parameter str: 指定文本对象
   - Parameter pattern: 指定正则表达式
   - Parameter replaceWith: 替换的字符串
   */
  class func replaceByString(str: String, pattern: String, replaceWith: String) -> String {
    var result: String = str
    do {
      let patterns = try NSRegularExpression(pattern: pattern,
                                             options: NSRegularExpressionOptions(rawValue: 0))
      result = patterns.stringByReplacingMatchesInString(str,
                                                         options: NSMatchingOptions(rawValue:0),
                                                         range: NSMakeRange(0, str.characters.count),
                                                         withTemplate: replaceWith)
    }
    catch {
    }
    return result
  }
  
  /**
   将字符串转化为字符数组
   - Parameter str: 指定字符串
   */
  class func stringToCharacter(str:String) ->[Character] {
    return Array(str.characters)
  }
  
  /**
   分割指定字符串以数组返回
   - Parameter str: 指定字符串
   - Parameter bySymbol: 指定分割字符
   */
  class func stringSplit(str:String, bySymbol: String = " ") -> [String] {
    return str.componentsSeparatedByString(bySymbol)
  }
  
  /**
   是否匹配指定正则表达式的描述
   - Parameter str: 指定字符串
   - Parameter pattern: 指定正则表达式
   */
  class func isMatch(str: String, pattern: String) -> Bool {
    var isMatch:Bool = false
    do {
      let regex = try NSRegularExpression(pattern: pattern,
                                          options: [.CaseInsensitive])
      let result = regex.firstMatchInString(str,
                                            options: NSMatchingOptions(rawValue: 0),
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
  
  /**
   剔除字符串两端的空白字符
   [（参考）](http://chrismontrois.net/2014/08/02/swift-techniques-strings/)
   - Parameter string: 指定字符串
   */
  class func trim(string: String) -> String {
    let spaceSet = NSCharacterSet.whitespaceCharacterSet()
    let trimmed = string.stringByTrimmingCharactersInSet(spaceSet)
    return trimmed
  }
  
  /**
   剔除字符串中末尾的空白字符
   - SeeAlso `trim(_:)`
   */
  class func trimTail(string: String) -> String {
    return replaceByString(string, pattern: "\\s+$", replaceWith: "")
  }
  
  /**
   剔除字符串中起始的空白字符
   - SeeAlso `trim(_:)`
   */
  class func trimHead(string: String) -> String {
    return replaceByString(string, pattern: "^\\s+", replaceWith: "")
  }
  
  /**
   检查指定字符串是否为起始字符串
   - Parameter str: 原始字符串
   - Parameter head: 起始字符串
   */
  class func startWith(str: String, head: String) -> Bool {
    let offset = min(head.characters.count, str.characters.count)
    return str.substringToIndex(str.startIndex.advancedBy(offset)) == head
  }
  
  /**
   检查指定字符串是否为结尾字符串
   - Parameter str: 原始字符串
   - Parameter tail: 结尾字符串
   */
  class func endWith(str: String, tail: String) -> Bool {
    let offset = min(str.characters.count, max(str.characters.count - tail.characters.count, 0))
    return str.substringFromIndex(str.startIndex.advancedBy(offset)) == tail
  }
  
  /**
   指定延迟秒数后执行函数
   - Parameter delay: 指定秒数
   - Parameter closure: 指定函数
   - Author: Matt Neuburg
   */
  class func delay(delay: Double, closure:() -> ()) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC))),
                   dispatch_get_main_queue(), closure)
  }
  
  /**
   为指定文本添加字体颜色修饰
   - Parameter txt: 指定文本对象
   - Parameter locationLength: 需要修饰的字符串索引（开始和结束索引）
   - Parameter color: 字体颜色数组
   */
  class func mutableTextFormat(txt: UITextField, locationLength: [Int: Int], color: [UIColor]) {
    if txt.text != nil {
      let d = NSMutableAttributedString(string: txt.text!)
      //let location: ((index: Int, element: (Int, Int)))
      for (location) in locationLength.enumerate() {
        d.addAttribute(NSForegroundColorAttributeName,
                       value: color[location.index],
                       range: NSRange(location: location.element.0, length: location.element.1))
      }
      txt.attributedText = d
    }
  }
  
  /**
   检查指定文本中是否包含数字字符
   - Parameter txt: 指定文本对象
   - Returns: 返回是否为数字的组合对象
   */
  class func textContentIsDecimalDigit(txt: UITextField) -> Bool {
    let nonDecimal = NSCharacterSet.decimalDigitCharacterSet().invertedSet
    let str = txt.text
    let isNum = str?.stringByTrimmingCharactersInSet(nonDecimal).characters.count
      == str?.characters.count
    return isNum
  }
  
  /**
   检查指定文本中是否包含字母和数字的字符
   - Parameter txt: 指定文本对象
   - Returns: 返回是否为字母数字的组合对象
   */
  class func textContentIsAlphanumeric(txt: UITextField) -> Bool {
    let nonAlphanumeric = NSCharacterSet.alphanumericCharacterSet().invertedSet
    let str = txt.text
    let isAlphanumeric = str?.stringByTrimmingCharactersInSet(nonAlphanumeric).characters.count
      == str?.characters.count
    return isAlphanumeric
  }
  
  /**
   获取当前指定字符串中汉字字符的数量
   - Parameter str: 指定字符串
   - Returns: 返回匹配的汉字字符数量
   #### usage example
   ````
   let chineseWorcCount = retriveChineseCharacterCount("abcd甲乙丙丁") //4
   ````
   */
  class func retriveChineseCharacterCount(str: String) -> Int {
    var result = 0
    do {
      let regex = try NSRegularExpression(pattern: "[\\u4E00-\\u9FA5]",
                                          options: NSRegularExpressionOptions(rawValue: 0))
      let matchNum = regex.numberOfMatchesInString(str,
                                                   options: NSMatchingOptions(rawValue: 0),
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
