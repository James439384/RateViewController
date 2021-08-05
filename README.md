# RateViewController

Installation with CocoaPods:

1. Run 'pod init' on your project
2. Open podfile created on your project folder
3. Write pod 'RateViewController', :git => 'https://github.com/InheritxSolution/RateViewController.git' in your podfile.
4. Run 'pod install'

Usage:

var objRateView = RateViewController()
objRateView?.delegate = self \n
objRateView?.modalPresentationStyle = .overFullScreen \n
self.present(objRateView ?? UIViewController(), animated: true, completion: nil)
