Pod::Spec.new do |s|
  s.name             = "TNKFoundation"
  s.version          = "1.1.0"
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
  
  s.subspec "AutoLayout" do |sp|
    sp.platform = :ios
    sp.source_files = "Pod/AutoLayout/*.swift"
  end
  
  s.subspec "GCD" do |sp|
    sp.source_files = "Pod/GCD/*.swift"
  end
  
  s.subspec "NSNumber" do |sp|
    sp.source_files = "Pod/NSNumber/*.swift"
  end

  s.subspec "NSPredicate" do |sp|
    sp.source_files = "Pod/NSPredicate/*.swift"
  end

  s.subspec "NSTimeInterval" do |sp|
    sp.source_files = "Pod/NSTimeInterval/*.swift"
  end
  
  s.subspec "NSURLQueryItem" do |sp|
    sp.source_files = "Pod/NSURLQueryItem/*.swift"
  end
  
  s.subspec "ObjectGraph" do |sp|
    sp.source_files = "Pod/ObjectGraph/*.swift"
  end
  
  s.subspec "ShapeView" do |sp|
    sp.platform = :ios
    sp.source_files = "Pod/ShapeView/*.swift"
  end
end
