//
//  StringExt.swift
//  TODO
//
//

import Foundation

//@see
//https://www.raywenderlich.com/86205/nsregularexpression-swift-tutorial
//http://andybargh.com/swift-strings/
//http://chrismontrois.net/2014/08/02/swift-techniques-strings/

extension String {
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
  
  func charAt(index: Int) -> String {
    let count = self.length
    var str = "" //if str is a character, it is Illegal
    if index >= 0 && index <= count - 1{
      let index = self.startIndex.advancedBy(index)..<self.startIndex.advancedBy(index + 1)
      str = self[index]
    }
    return str
  }
  
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
  
  func reverse() -> String {
    return String(self.characters.reverse())
  }
  
  //get string's length
  var length: Int {
    return self.characters.count
  }
}

