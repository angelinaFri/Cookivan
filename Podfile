platform :ios, '12.0'
use_frameworks!
inhibit_all_warnings!

target 'Cookivan' do
  pod 'Firebase/Core'
  pod 'Firebase/Auth'
  pod 'Firebase/Firestore'
  pod 'Firebase/Storage'
  pod 'IQKeyboardManagerSwift'

  target 'CookivanTests' do
    inherit! :search_paths
  end

end

post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    config.build_settings['CLANG_ANALYZER_LOCALIZABILITY_NONLOCALIZED'] = 'YES'
  end
end
