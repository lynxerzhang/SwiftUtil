//: Playground - noun: a place where people can play

//create xcode 7.2.1 and swift 2.1.1
import UIKit

//create a new array
var programingLanguage = [String]()
var appleLanguage = ["swift", "Objective-C"]
var webLanguage = ["Javascript", "Actionscript"]

//contain "swift", "Objective-C", Javascript, Actionscript
programingLanguage = appleLanguage + webLanguage

//current study programming language is swift
var currentStudy = programingLanguage[0]

//swift, Objective-C
let apple = programingLanguage[0...1]

//swift
programingLanguage.first
//ActionScript
programingLanguage.last

//swift
programingLanguage.maxElement()
//ActionScript
programingLanguage.minElement()

//4 element
programingLanguage.capacity
//4 element
programingLanguage.count
//not empty
programingLanguage.isEmpty

//iterating
for item in programingLanguage
{
}

for (index, item) in programingLanguage.enumerate()
{
}

//array method
programingLanguage.contains("Swift") //true
programingLanguage.dropFirst(2) //return a new array contains all but the first 2 elements
programingLanguage.dropLast(2) //return a new array contains all but the last 2 elements
print(programingLanguage) //not alter the orignal array

programingLanguage.map {
    $0.lowercaseString //return a new array, not alter the original array
}

//@see http://stackoverflow.com/questions/6356043/how-do-i-detect-if-a-character-is-uppercase-or-lowercase
//获取数组中所有首字母为大写的对象，不修改原始数组
programingLanguage.filter {
    return NSCharacterSet.uppercaseLetterCharacterSet().characterIsMember(unichar(($0.unicodeScalars.first?.value)!))
}

programingLanguage.prefix(2)
programingLanguage.suffix(2)

//sort
var numAry = [0, 10, 8, 2]
//numAry.sortInPlace(<) //直接在原始数组中进行排序
//numAry = numAry.sort(<) //不修改原始数组，将结果作为新书组返回

struct DataObj {
    let version: Double
    let dataValue: String
}

var structAry: [DataObj] = [DataObj(version: 3, dataValue: "as"), DataObj(version: 2, dataValue: "ObjectiveC"), DataObj(version: 2.1, dataValue: "Swift")]
structAry.sortInPlace {
    $0.version < $1.version
}

