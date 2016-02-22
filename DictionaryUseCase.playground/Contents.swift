//: Playground - noun: a place where people can play

//create xcode 7.2.1 and swift 2.1.1
import UIKit

var dict = [String:String]()
dict["actionscript"] = "3.0"
dict["swift"] = "2.1.1"
dict["objective-c"] = "2.0"
print(dict.count) //length

let appleNewLanguageVersion = dict["swift"] //get a value
let currentUseLanguageKeys = [String](dict.keys) //get keys
let currentUseLanguageValues = [String](dict.values) //get values

//below are common dictionary method
dict["javascript"] = "1.0"
print(dict.count)  //4
dict["javascript"] = nil
print(dict.count)  //3

let oldvalue = dict.updateValue("3.0", forKey: "swift")
dict.popFirst() //丢弃第一对键值，但在这里并未丢弃actionscript键，而是swift键
print(dict)  //["objective-c": "2.0", "actionscript": "3.0"]

//iteration
for (key, value) in dict {
    //print(key + "_" + value)
}
for value in dict.values {
    //print(value)
}
for key in dict.keys {
    //print(key)
}
dict.forEach { (key, value) in
    //print(key, value)
}

//index
let endIndex = dict.endIndex
let startIndex = dict.startIndex
print(endIndex == startIndex.successor().successor()) //true

let objectiveIndex = dict.indexForKey("objective-c")
print(startIndex == objectiveIndex) //true

let actionscriptIndex = dict.indexForKey("actionscript")
print(actionscriptIndex == startIndex.successor()) //true
dict.removeAtIndex(actionscriptIndex!)
print(dict) //["objective-c": "2.0"]
