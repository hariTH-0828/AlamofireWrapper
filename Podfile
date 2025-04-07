platform :ios, '16.0'
install! 'cocoapods', :warn_for_unused_master_specs_repo => false

target 'AlamofireWrapper' do
  use_frameworks!
  
  pod 'Alamofire', '~> 5.4'
  
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '16.0'
      end
    end
    
    installer.aggregate_targets.each do |target|
      target.xcconfigs.each do |variant, xcconfig|
        xcconfig_path = target.client_root + target.xcconfig_relative_path(variant)
        IO.write(xcconfig_path, IO.read(xcconfig_path).gsub("OTHER_LDFLAGS = $(inherited)", "OTHER_LDFLAGS = $(inherited) -all_load"))
      end
    end
    
    installer.generated_projects.each do |project|
      project.targets.each do |target|
        target.build_configurations.each do |config|
          config.build_settings['LD_RUNPATH_SEARCH_PATHS'] = ['$(inherited)', '@executable_path/Frameworks', '@loader_path/Frameworks']
        end
      end
    end
  end
end
