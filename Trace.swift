/**
 输出调试日志至控制台
 
 @see http://www.blendedcocoa.com/blog/2014/06/12/file-function-etc-as-defaults-in-swift/
 */
func Trace(message: String, function: String = __FUNCTION__){
    print("\(__FILE__)-\(function):\(__LINE__)-->\(message)")
}