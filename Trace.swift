//
//  Trace.swift
//
import Foundation

func trace(message: String, file: String = #file, function: String = #function, line: Int = #line) {
  #if DEVELOPMENT
    print("\(NSString(string: file).lastPathComponent)'s \(function) at:\(line) --> \(message)")
  #else
    //NSStringFromClass(self.dynamicType)
  #endif
}

func dump(message: String, withContext: String) {
  #if DEVELOPMENT
    print("\(withContext):\(message)")
  #else
  
  #endif
}