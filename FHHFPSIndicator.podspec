#
#  Be sure to run `pod spec lint FHHFPSIndicator.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "FHHFPSIndicator"
  s.summary      = "show FPS On keyWindow."
  s.version      = "1.0.0"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { "002and001" => "xxewz1@163.com" }
  s.social_media_url = 'http://www.jianshu.com/users/d8d972561b59/timeline'
  s.homepage     = "https://github.com/jvjishou/FHHFPSIndicator"
  s.source       = { :git => "https://github.com/jvjishou/FHHFPSIndicator.git", :tag => s.version }
  s.frameworks   = 'Foundation', 'UIKit'
  s.platform     = :ios, '7.0'
  s.source_files = 'FHHFPSIndicator/**/*.{h,m,png}'
  s.requires_arc = true

end
