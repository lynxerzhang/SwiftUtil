//: Playground - noun: a place where people can play
//@see https://www.appcoda.com/swift3-changes/

import UIKit
import XCPlayground //show assistant editor

class Responder: NSObject {
  func tap() {
    print("button pressed")
  }
}

let responder = Responder()

let button = UIButton(type: .System)
button.setTitle("Buttons", forState: .Normal)
button.addTarget(responder,
                 action: #selector(Responder.tap),
                 forControlEvents: .TouchUpInside)
button.sizeToFit()
button.center = CGPoint(x: 50, y: 100)

let frame = CGRect(x: 0, y: 0, width: 100, height: 200)
let view = UIView(frame: frame)
view.backgroundColor = UIColor.clearColor()
view.addSubview(button)

XCPlaygroundPage.currentPage.liveView = view

print(button.bounds) //(0.0, 0.0, 54.0, 30.0)
print(button.center) //(50.0, 100.0)
print(button.frame) //(23.0, 85.0, 54.0, 30.0)
print(button.bounds.midX) //27.0
print(button.bounds.midY) //15.0
print(unsafeAddressOf(button)) //输出按钮内存地址
print(unsafeAddressOf(responder)) //如果报错则输出的对应内存地址

