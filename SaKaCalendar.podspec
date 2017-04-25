
Pod::Spec.new do |s|

  s.name         = "SaKaCalendar"
  s.version      = "1.0.1"
s.summary      = "自定义日历,农历和阳历同时显示."

  s.homepage     = "https://github.com/WeiKunChao/SaKaCalendar"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "WeiKunChao" => "17736289336@163.com" }

  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/WeiKunChao/SaKaCalendar.git", :tag => "1.0.1" }

  s.source_files  = "SaKaCalendar/**/*.{h,m}"

  s.public_header_files = "SaKaCalendar/**/*.h"

  s.frameworks = "UIKit", "Foundation"

  s.requires_arc = true


end
