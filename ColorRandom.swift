//Jared Davidson's Random Colorization
//could run in xcode7.2.1 and swift2.1.1
//drand48返回0 － 1的随机Double数值
var red = CGFloat(drand48())
var green = CGFloat(drand48())
var blue = CGFloat(drand48())

var view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

//随机色
view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)

//根据对应的red,green,blue数值返回UIColor对象(0 - 255)
func rgbColor(red: Int, _ green: Int, _ blue: Int) -> UIColor
{
    return UIColor(red: CGFloat(red) / 0xFF, green: CGFloat(green) / 0xFF, blue: CGFloat(blue) / 0xFF, alpha: 1.0)
}

//example
view.backgroundColor = rgbColor(255, 255, 0) //纯黄色的背景