//
//  System.swift
//

//@see
//http://themainthread.com/blog/2015/06/simulator-check-in-swift.html
import UIKit

class System {
  
  class var name: String {
    return UIDevice.currentDevice().name //iPhone Simulatoror or user's device name
  }
  
  class var iOSVersion: String {
    return UIDevice.currentDevice().systemVersion //9.3
  }
  
  class var systemName: String {
    return UIDevice.currentDevice().systemName //iPhone OS
  }
  
  class var model: String {
    return UIDevice.currentDevice().model //iPad or iPad Simulator
  }
  
  class func getiOSVersionWithSemantic() -> (major: Int, minor: Int, patch: Int) {
    let iOSVersionWithSemantic = NSProcessInfo().operatingSystemVersion
    return (major: iOSVersionWithSemantic.majorVersion, minor: iOSVersionWithSemantic.minorVersion,
            patch: iOSVersionWithSemantic.patchVersion)
  }
  
  class var isiPhone: Bool {
    return UIDevice.currentDevice().userInterfaceIdiom
      == UIUserInterfaceIdiom.Phone
  }
  
  class var isiPad: Bool {
    return UIDevice.currentDevice().userInterfaceIdiom
      == UIUserInterfaceIdiom.Pad
  }
  
  class func hasClass(classNameStr: String) -> Bool {
    return NSClassFromString(classNameStr) != nil
  }
}



