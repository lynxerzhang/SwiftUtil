//
//  System.swift
//
import UIKit
/**
 输出运行系统的一些信息[参考](http://themainthread.com/blog/2015/06/simulator-check-in-swift.html)
 */
class System {
  /**
   返回用户当前的设备名称（在设置－通用中可以查看，或者返回模拟器名称）
   #### usage example
   ````
   print(name) //iPhone Simulatoror or user's device name
   ````
   */
  class var name: String {
    return UIDevice.currentDevice().name
  }
  
  
  /**
   返回iOS版本（譬如 9.3）
   */
  class var iOSVersion: String {
    return UIDevice.currentDevice().systemVersion
  }
  
  /**
   返回系统名称 （譬如iOS，tvOS）
   */
  class var systemName: String {
    return UIDevice.currentDevice().systemName
  }
  
  /**
   返回设备类型名称（譬如iPad，iPad Simulator）
   */
  class var model: String {
    return UIDevice.currentDevice().model
  }
  
  /**
   返回当前iOS版本的元组类型（tuple）
   */
  class func getiOSVersionWithSemantic() -> (major: Int, minor: Int, patch: Int) {
    let iOSVersionWithSemantic = NSProcessInfo().operatingSystemVersion
    return (major: iOSVersionWithSemantic.majorVersion, minor: iOSVersionWithSemantic.minorVersion,
            patch: iOSVersionWithSemantic.patchVersion)
  }
  
  /**
   查看是否为iPhone
   */
  class var isiPhone: Bool {
    return UIDevice.currentDevice().userInterfaceIdiom
      == UIUserInterfaceIdiom.Phone
  }
  
  /**
   查看是否为iPad
   */
  class var isiPad: Bool {
    return UIDevice.currentDevice().userInterfaceIdiom
      == UIUserInterfaceIdiom.Pad
  }
  
  
  /**
   查看运行时是否存在指定的类
   */
  class func hasClass(classNameStr: String) -> Bool {
    return NSClassFromString(classNameStr) != nil
  }
}



