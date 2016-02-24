//: Playground - noun: a place where people can play

//create xcode 7.2.1 and swift 2.1.1
import UIKit

var str = "swift is a programming Language"

//print characters in str
for value in str.characters {
    //print(value)
}

//print index and character
for (index, value) in str.characters.enumerate() {
    //print(index, value)
}

//length
print(str.characters.count)

//indexOf
str.characters.indexOf("i") //2

//str.uppercaseString
//str.lowercaseString

//截取字符串
func substring(val: String, startIndex: Int, endIndex: Int) -> String? {
    let len = val.characters.count
    if len == 0 {
        return nil
    }
    return str[str.startIndex.advancedBy(startIndex)..<str.startIndex.advancedBy(endIndex)]
}
//substring(str, startIndex: 0, endIndex: 5) //swift

//截取字符串，以所需长度为度
func substr(val: String, startIndex: Int, dis: Int) -> String? {
    let len = val.characters.count
    if len == 0 {
        return nil
    }
    return str[str.startIndex.advancedBy(startIndex)..<str.startIndex.advancedBy(startIndex + dis)]
}
//substr(str, startIndex: 2, dis: 2) //if

//检测指定位置字符
func charAt(val: String, findIndex: Int) -> Character? {
    let len = val.characters.count
    if findIndex < 0 || findIndex >= len {
        return nil
    }
    let index = val.characters.startIndex.advancedBy(findIndex)
    return val[index]
}
//charAt(str, findIndex: 0) //s
//charAt(str, findIndex: 1) //w
//charAt(str, findIndex: 2) //i
//charAt(str, findIndex: 3) //f
//charAt(str, findIndex: 4) //t

//检测指定的字符的utf8数值
func charCodeAt(val: String, findIndex: Int) -> UInt8? {
    let len = val.characters.count
    if findIndex < 0 || findIndex >= len {
        return nil
    }
    let index = val.utf8.startIndex.advancedBy(findIndex)
    return val.utf8[index]
}
//charCodeAt(str, findIndex: 0) //115
//charCodeAt(str, findIndex: 1) //119
//charCodeAt(str, findIndex: 2) //105
//charCodeAt(str, findIndex: 3) //102
//charCodeAt(str, findIndex: 4) //116
