Pod::Spec.new do |s|
  s.name             = 'BXWeChatSDK'
  s.version          = '1.7.6'
  s.summary          = 'WeChat SDK for iOS to access WeChat platform.'
  s.description      = 'It is a shame that WeChat does not have an official pod for their iOS SDK. Therefore, we create this pod to track the official WeChat iOS SDK.'
  s.homepage         = 'https://github.com/iException/BXWeChatSDK'
  s.license          = { :type => 'Custom', :file => 'LICENSE' }
  s.author           = { 'Yiming Tang' => 'yimingnju@gmail.com' }
  s.source           = { :git => 'https://github.com/iException/BXWeChatSDK.git', :tag => "v#{s.version.to_s}" }
  s.platform         = :ios, '7.0'
  s.requires_arc     = true
  s.source_files     = 'WeChatSDK/*.{h,m}'
  s.vendored_libraries  = 'WeChatSDK/libWeChatSDK.a'
  s.frameworks = 'CFNetwork', 'CoreTelephony', 'Security', 'SystemConfiguration'
  s.libraries = 'c++', 'sqlite3', 'z'
  s.pod_target_xcconfig = {
    'OTHER_LDFLAGS' => '-ObjC -all_load'
  }
end
