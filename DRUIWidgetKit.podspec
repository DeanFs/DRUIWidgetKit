#
# Be sure to run `pod lib lint DRUIWidgetKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DRUIWidgetKit'
  s.version          = '0.1.22'
  s.summary          = '多融UI控件库'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/DeanFs/DRUIWidgetKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Dean_F' => 'stone.feng1990@gmail.com' }
  s.source           = { :git => 'https://github.com/DeanFs/DRUIWidgetKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.resource = 'DRUIWidgetKit/Assets/*', 'DRUIWidgetKit/Classes/**/*.xib'

  s.subspec 'Common' do |ss|
      ss.source_files = 'DRUIWidgetKit/Classes/Common/*.{h,m}'
  end

  s.subspec 'PickerContainerView' do |ss|
      ss.source_files = 'DRUIWidgetKit/Classes/PickerContainerView/*.{h,m}'
      ss.dependency 'DRUIWidgetKit/Common'
  end

  s.subspec 'TopBar' do |ss|
      ss.source_files = 'DRUIWidgetKit/Classes/TopBar/*.{h,m}'
      ss.dependency 'DRUIWidgetKit/Common'
  end

  s.subspec 'Segment' do |ss|
      ss.source_files = 'DRUIWidgetKit/Classes/Segment/*.{h,m}'
      ss.dependency 'DRUIWidgetKit/Common'
  end

  s.subspec 'SectionView' do |ss|
      ss.source_files = 'DRUIWidgetKit/Classes/SectionView/*.{h,m}'
      ss.dependency 'DRUIWidgetKit/Common'
  end

  s.subspec 'OptionCard' do |ss|
      ss.source_files = 'DRUIWidgetKit/Classes/OptionCard/*.{h,m}'
      ss.dependency 'DRUIWidgetKit/Common'
  end

  s.subspec 'HourMinutePickerView' do |ss|
      ss.source_files = 'DRUIWidgetKit/Classes/HourMinutePickerView/*.{h,m}'
      ss.dependency 'DRUIWidgetKit/Common'
  end

  s.subspec 'DatePickerView' do |ss|
      ss.source_files = 'DRUIWidgetKit/Classes/DatePickerView/*.{h,m}'
      ss.dependency 'DRUIWidgetKit/Common'
  end

  s.subspec 'LunarDatePickerView' do |ss|
      ss.source_files = 'DRUIWidgetKit/Classes/LunarDatePickerView/*.{h,m}'
      ss.dependency 'DRUIWidgetKit/Common'
  end

  s.subspec 'WeekPickerView' do |ss|
      ss.source_files = 'DRUIWidgetKit/Classes/WeekPickerView/*.{h,m}'
      ss.dependency 'DRUIWidgetKit/Common'
  end

  s.subspec 'TimeConsumePickerView' do |ss|
      ss.source_files = 'DRUIWidgetKit/Classes/TimeConsumePickerView/*.{h,m}'
      ss.dependency 'DRUIWidgetKit/Common'
  end

  s.subspec 'ValuePickerView' do |ss|
      ss.source_files = 'DRUIWidgetKit/Classes/ValuePickerView/*.{h,m}'
      ss.dependency 'DRUIWidgetKit/Common'
  end

  s.subspec 'CityPickerView' do |ss|
      ss.source_files = 'DRUIWidgetKit/Classes/CityPickerView/*.{h,m}'
      ss.dependency 'DRUIWidgetKit/Common'
  end

  s.subspec 'NormalDataPickerView' do |ss|
      ss.source_files = 'DRUIWidgetKit/Classes/NormalDataPickerView/*.{h,m}'
      ss.dependency 'DRUIWidgetKit/Common'
  end

  s.subspec 'ClassDurationPickerView' do |ss|
      ss.source_files = 'DRUIWidgetKit/Classes/ClassDurationPickerView/*.{h,m}'
      ss.dependency 'DRUIWidgetKit/NormalDataPickerView'
  end

  s.subspec 'ClassRemindTimePickerView' do |ss|
      ss.source_files = 'DRUIWidgetKit/Classes/ClassRemindTimePickerView/*.{h,m}'
      ss.dependency 'DRUIWidgetKit/NormalDataPickerView'
  end

  s.subspec 'ClassTermPickerView' do |ss|
      ss.source_files = 'DRUIWidgetKit/Classes/ClassTermPickerView/*.{h,m}'
      ss.dependency 'DRUIWidgetKit/NormalDataPickerView'
  end

  s.subspec 'CheckboxGroupView' do |ss|
      ss.source_files = 'DRUIWidgetKit/Classes/CheckboxGroupView/*.{h,m}'
      ss.dependency 'DRUIWidgetKit/NormalDataPickerView'
  end

  # 布局信息
  s.subspec 'CustomLayout' do |ss|
      ss.source_files = 'DRUIWidgetKit/Classes/CustomLayout/*/*.{h,m}'
      ss.dependency 'DRUIWidgetKit/Common'
  end

  # 星星评级
  s.subspec 'StarRateView' do |ss|
      ss.source_files = 'DRUIWidgetKit/Classes/StarRateView/*.{h,m}'
      ss.dependency 'DRUIWidgetKit/Common'
  end

  # pageControl
  s.subspec 'DRPageControl' do |ss|
      ss.source_files = 'DRUIWidgetKit/Classes/DRPageControl/*.{h,m}'
      ss.dependency 'DRUIWidgetKit/Common'
  end

  # 音频录音水波
  s.subspec 'VoiceWaveView' do |ss|
      ss.source_files = 'DRUIWidgetKit/Classes/VoiceWaveView/*.{h,m}'
      ss.dependency 'DRUIWidgetKit/Common'
  end

  # 控件水平collectionview 带pagecontrol
  s.subspec 'HorizenPageView' do |ss|
      ss.source_files = 'DRUIWidgetKit/Classes/HorizenPageView/*.{h,m}'
      ss.dependency 'DRUIWidgetKit/Common'
      ss.dependency 'DRUIWidgetKit/CustomLayout'
      ss.dependency 'DRUIWidgetKit/DRPageControl'
  end

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'

  s.dependency 'Masonry'
  s.dependency 'DRCategories'
  s.dependency 'DRMacroDefines'
  s.dependency 'DRToastView'
  s.dependency 'HexColors', '4.0.0'
  s.dependency 'BlocksKit'
  s.dependency 'YYModel'

end
