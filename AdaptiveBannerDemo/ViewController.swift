//
//  ViewController.swift
//  AdaptiveBannerDemo
//
//  Created by k-arimura on 2022/04/13.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController, GADBannerViewDelegate{
    
    var bannerView :GADBannerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Step 1: Create an inline adaptive banner ad size. This size is used to
        // request your adaptive banner. You can pass in the width of the device, or set
        // your own width. This example sets a static width.
        let adSize = GADCurrentOrientationInlineAdaptiveBannerAdSizeWithWidth(320)
        // Step 2: Create banner with the inline size and set ad unit ID.
        let bannerView = GADBannerView(adSize: adSize)
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.delegate = self
        
        self.view.addSubview(bannerView)
        self.bannerView = bannerView
        

        // Step 3: Load an ad.
        let request = GADRequest()
        bannerView.load(request)
    }
    
    func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
      print("bannerViewDidReceiveAd")
    }

    func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
      print("bannerView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }

    func bannerViewDidRecordImpression(_ bannerView: GADBannerView) {
      print("bannerViewDidRecordImpression")
    }

    func bannerViewWillPresentScreen(_ bannerView: GADBannerView) {
      print("bannerViewWillPresentScreen")
    }

    func bannerViewWillDismissScreen(_ bannerView: GADBannerView) {
      print("bannerViewWillDIsmissScreen")
    }

    func bannerViewDidDismissScreen(_ bannerView: GADBannerView) {
      print("bannerViewDidDismissScreen")
    }
}

