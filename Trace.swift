//
//  Trace.swift
//
import Foundation

/**
 输出当前执行环境的路径（模块名－类名－方法名－行数）
 - Parameter message: 需要输出的字符串
 - Parameter file:    默认输出模块名和类名
 - Parameter function: 默认输出方法名
 - Parameter line:     默认输出当前行数
 - Remark:
 file, function, line 参数可留空
 #### usage example
 ````
 trace("execute init")
 ````
 */
func trace(message: String, file: String = #file, function: String = #function, line: Int = #line) {
  #if DEVELOPMENT
    print("\(NSString(string: file).lastPathComponent)'s \(function) at:\(line) --> \(message)")
  #else
    //NSStringFromClass(self.dynamicType)
  #endif
}


/**
 - SeeAlso  `trace(_:file:function:line:)`
 */
func dump(message: String, withContext: String) {
  #if DEVELOPMENT
    print("\(withContext):\(message)")
  #else
    
  #endif
}