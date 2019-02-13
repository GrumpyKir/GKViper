Pod::Spec.new do |s|

s.platform = :ios
s.ios.deployment_target = '10.0'
s.name = "GKViper"
s.summary = "Basic classes to work with VIPER arch"
s.requires_arc = true
s.version = "0.4.1"
s.license = { :type => "MIT", :file => "LICENSE" }
s.author = { "Opekishev Kirill" => "grumpykir@gmail.com" }
s.homepage = "https://github.com/GrumpyKir/GKViper"
s.source = { :git => "https://github.com/GrumpyKir/GKViper.git",
			 :tag => "#{s.version}" }
s.framework = "UIKit"
s.dependency 'GKExtensions', '~> 1.0.0'
s.dependency 'GKNetwork', '~> 0.5.1'
s.source_files = "GKViper/SourceData/*.swift"
s.swift_version = "4.2"

end
