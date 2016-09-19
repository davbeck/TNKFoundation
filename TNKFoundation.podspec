Pod::Spec.new do |s|
  s.name             = "TNKFoundation"
  s.version          = "3.0.0"
  s.summary          = "A collection of small utilities in Swift."

  s.homepage         = "https://github.com/davbeck/TNKFoundation"
  s.license          = 'MIT'
  s.author           = { "David Beck" => "code@thinkultimate.com" }
  s.source           = { :git => "https://github.com/davbeck/TNKFoundation.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/davbeck'
  
  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.10'
  s.watchos.deployment_target = '2.0'
  s.requires_arc = true
  s.swift_version = '3.0'

  s.subspec "NSPredicate" do |sp|
    sp.source_files = "TNKFoundation/NSPredicate/*.swift"
  end

  s.subspec "NSTimeInterval" do |sp|
    sp.source_files = "TNKFoundation/NSTimeInterval/*.swift"
  end
  
  s.subspec "NSURLQueryItem" do |sp|
    sp.source_files = "TNKFoundation/NSURLQueryItem/*.swift"
  end
  
  s.subspec "ObjectGraph" do |sp|
    sp.source_files = "TNKFoundation/ObjectGraph/*.swift"
  end
end
