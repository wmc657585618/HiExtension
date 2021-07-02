Pod::Spec.new do |s|
    s.name         = "HiExension"
    s.version      = "1.0.1"
    s.summary      = "HiExension is written for developer."
    s.description  = "HiExension is written for developer, use easy"
    s.homepage     = "hhttps://github.com/wmc657585618/HiExtension"
    s.author       = { "four" => "657585618@qq.com" }
    s.license      = "MIT"
    s.platform     = :ios, "7.0"
    s.source       = { :git => "https://github.com/wmc657585618/HiExtension.git", :tag => "#{s.version}" }
    s.source_files  = "HIExension/NSExtension/**/*.{h,m}"
end
