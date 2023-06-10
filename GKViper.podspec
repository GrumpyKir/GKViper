Pod::Spec.new do |spec|
	spec.platform				= :ios
	spec.ios.deployment_target	= "14.0"

	spec.name 			= "GKViper"
	spec.version 		= "1.2.2"
	spec.license 		= { :type => "MIT", :file => "LICENSE" }
	spec.homepage 		= "https://github.com/stapp-tech/Viper"
	spec.author 		= { "Opekishev Kirill" => "grumpykir@gmail.com" }
	spec.summary 		= "Basic classes to work with VIPER arch"
	spec.source 		= { :git => "https://github.com/stapp-tech/Viper.git", :tag => "#{spec.version}" }
	spec.swift_version 	= "5.0"

	spec.source_files = "GKViper/SourceData/*.swift"
	
	spec.framework		= "UIKit"
	spec.requires_arc	= true
	spec.dependency 'GKExtensions', '~> 1.2.0'
end
