
Pod::Spec.new do |s|
  s.name             = 'DNSPageView'
  s.version          = '1.0.0'
  s.summary          = 'DNSPageView is a lightweight, pure-Swift library.'
  s.description      = <<-DESC
                       DNSPageView is a lightweight, pure-Swift library for pageView.
                       DESC

  s.homepage         = 'https://github.com/Danie1s/DNSPageView-ObjC'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Daniels' => '176516837@qq.com' }
  s.source           = { :git => 'https://github.com/Danie1s/DNSPageView-ObjC.git', :tag => s.version }

  s.ios.deployment_target = '8.0'

  s.public_header_files = 'DNSPageView-ObjC/DNSPageView_ObjC.h'
  s.source_files = 'DNSPageView-ObjC/*.{h,m}'
  s.requires_arc = true

end