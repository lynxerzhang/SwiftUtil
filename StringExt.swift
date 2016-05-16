//
//  StringExt.swift
//  TODO
import Foundation
//@see
//https://www.raywenderlich.com/86205/nsregularexpression-swift-tutorial
//http://andybargh.com/swift-strings/
//http://chrismontrois.net/2014/08/02/swift-techniques-strings/
extension String {
  
  /**
   截取字符串
   - Parameter startIndex: 起始索引点
   - Parameter endIndex:   结束索引点（最终字符串中不会包含该字符）
   - Returns: 返回指定截取的字符串
   */
  func slice(startIndex: Int = 0, endIndex: Int = Int.max) -> String {
    var str = ""
    var start = startIndex, end = endIndex
    let count = self.length
    if start < 0 {
      if start < -count {
        start = -count
      }
      start += count
    }
    if end < 0 {
      end += count
    }
    else if end > count {
      end = count
    }
    if end >= start {
      let index = self.startIndex.advancedBy(start)..<self.startIndex.advancedBy(end)
      str = self[index]
    }
    return str
  }
  
  /**
   截取字符串
   - Parameter startIndex: 起始索引点
   - Parameter len:   截取的字符串长度
   - Returns: 返回指定截取的字符串
   */
  func substr(startIndex: Int = 0, len: Int = Int.max) -> String {
    var str = ""
    var start = startIndex, end = len
    let count = self.length
    if end > count {
      end = count
    }
    if start < 0 {
      if start < -count {
        start = -count
      }
      start += count
    }
    end += start
    if end > count {
      end = count
    }
    if start < count {
      let index = self.startIndex.advancedBy(start)..<self.startIndex.advancedBy(end)
      str = self[index]
    }
    return str
  }
  
  /**
   截取字符串
   - Parameter startIndex: 起始索引点
   - Parameter endIndex:   结束索引点（最终字符串中不会包含该字符）
   - Returns: 返回指定截取的字符串
   */
  func substring(startIndex: Int = 0, endIndex: Int = Int.max) -> String {
    var str = ""
    var start = startIndex, end = endIndex
    let count = self.length
    if start < 0 {
      start = 0
    }
    if end < 0 {
      end = 0
    }
    if start > end {
      let tmp = end
      end = start
      start = tmp
    }
    if end > count {
      end = count
    }
    if start < count {
      let index = self.startIndex.advancedBy(start)..<self.startIndex.advancedBy(end)
      str = self[index]
    }
    return str
  }
  
  /**
   检查指定索引处的字符
   - Parameter index: 字符串中指定的索引值
   - Returns:  返回指定位置字符，默认为空字符
   */
  func charAt(index: Int) -> String {
    let count = self.length
    var str = "" //if str is a character, it is Illegal
    if index >= 0 && index <= count - 1{
      let index = self.startIndex.advancedBy(index)..<self.startIndex.advancedBy(index + 1)
      str = self[index]
    }
    return str
  }
  
  /**
   是否匹配指定字符串
   - Parameter pattern: 正则表达式
   */
  func isMatch(pattern: String) -> Bool {
    var isMatch:Bool = false
    do {
      let regex = try NSRegularExpression(pattern: pattern, options: [.CaseInsensitive])
      let result = regex.firstMatchInString(self, options: NSMatchingOptions(rawValue: 0),
                                            range: NSMakeRange(0, self.characters.count))
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
   检索指定字符串
   - Parameter val:        待搜索字符串
   - Parameter startIndex: 起始搜索索引
   - Returns: 返回搜索到的字符串最初索引位置，如没有搜索到返回－1
   */
  func indexOf(val: String, startIndex: Int = 0) -> Int {
    var findIndex: Int = -1
    let count = self.length
    var index = startIndex
    if index < 0 {
      index = 0
    }
    else if index > count {
      index = count
    }
    do {
      let regex = try NSRegularExpression(pattern: val, options: [.CaseInsensitive])
      let result = regex.rangeOfFirstMatchInString(self, options: NSMatchingOptions.ReportProgress,
                                                   range: NSMakeRange(index, count - index))
      
      if result.location != NSNotFound {
        findIndex = result.location
      }
    }
    catch {
      
    }
    return findIndex
  }
  
  /**
   前后翻转指定字符串
   */
  func reverse() -> String {
    return String(self.characters.reverse())
  }
  
  /**
   获取字符串长度
   */
  var length: Int {
    return self.characters.count
  }
}

