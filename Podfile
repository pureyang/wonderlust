# Uncomment this line to define a global platform for your project
# platform :ios, '6.0'

# Uncomment if using swift
use_frameworks!

target 'wonderlust' do
  pod 'Koloda', '~> 2.0'
end

target 'wonderlustTests' do

end

target 'wonderlustUITests' do

end

post_install do |installer|
    `find Pods -regex 'Pods/pop.*\\.h' -print0 | xargs -0 sed -i '' 's/\\(<\\)pop\\/\\(.*\\)\\(>\\)/\\"\\2\\"/'`
end
