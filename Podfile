# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def testingPods
  pod 'Quick'
  pod 'Nimble'
  pod 'Mockit'
end

target 'WeatherTask' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for WeatherTask
  pod 'Alamofire'
  pod 'Kingfisher'
  
  target 'WeatherTaskTests' do
    inherit! :search_paths
    testingPods
    # Pods for testing
  end

  target 'WeatherTaskUITests' do
    # Pods for testing
  end

end
