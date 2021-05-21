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

You can write this code on a button action to open rate view when clicked on a button.
We have created one delegate method so you can handle something when clicked on a close button available in our rate view.

I hope it's pretty much simple and you would love to use it.
Thanks.
