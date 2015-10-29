Pod::Spec.new do |s|
  s.name             = "TNKFoundation"
  s.version          = "1.0.0"
  s.summary          = "A collection of small utilities in Swift."

  s.homepage         = "https://github.com/davbeck/TNKFoundation"
  s.license          = 'MIT'
  s.author           = { "David Beck" => "code@thinkultimate.com" }
  s.source           = { :git => "https://github.com/davbeck/TNKFoundation.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/davbeck'
  
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.watchos.deployment_target = '2.0'
  s.requires_arc = true
  
  s.subspec "AutoLayout" do |sp|
    sp.platform = :ios
	sp.ios.deployment_target = '9.0'
    sp.source_files = "Pod/AutoLayout"
  end
  
  s.subspec "GCD" do |sp|
    sp.source_files = "Pod/GCD"
  end
  
  s.subspec "NSNumber" do |sp|
    sp.source_files = "Pod/NSNumber"
  end

  s.subspec "NSPredicate" do |sp|
    sp.source_files = "Pod/NSPredicate"
  end

  s.subspec "NSTimeInterval" do |sp|
    sp.source_files = "Pod/NSTimeInterval"
  end
  
  s.subspec "NSURLQueryItem" do |sp|
    sp.source_files = "Pod/NSURLQueryItem"
  end
  
  s.subspec "ObjectGraph" do |sp|
    sp.source_files = "Pod/ObjectGraph"
  end
  
  s.subspec "ShapeView" do |sp|
    sp.platform = :ios
    sp.source_files = "Pod/ShapeView"
  end
end
