

Pod::Spec.new do |s|

  s.name         = "WSDatePickerView"
  s.version      = "1.0.0"
  s.summary      = "一款多样式iOS日期选择器WSDatePickerView"

 
  s.homepage     = "https://github.com/Zws-China/DatePicker"


  s.license      = "MIT"

 

  s.platform     = :ios

  
  s.author       = { "784846767@qq.com" => "784846767@qq.com" }

  s.source       = { :git => "https://github.com/Zws-China/DatePicker.git", :tag => "#{s.version}" }


  s.source_files  = "WSDatePickerView/*.{h,m,xib}"
  
  s.requires_arc = true
 
end

