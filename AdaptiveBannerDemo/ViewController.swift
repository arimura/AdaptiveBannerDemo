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
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addLabels()
        //        initAndLoadBanner()
    }
    
    func addLabels(){
        let label1 = createLabel(text: "I sit alone in my four-cornered room. Starin' at candles. Oh, that shit is on? Let me drop some shit like this here, real smooth.")
        self.contentView.addSubview(label1)
        label1.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        label1.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        label1.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.8).isActive = true
        
        let label2 = createLabel(text: "At night I can't sleep, I toss and turn Candlesticks in the dark, visions of bodies bein' burned Four walls just starin' at a *****. I'm paranoid, sleepin' with my finger on the trigger. My mother's always stressin' I ain't livin' right. But I ain't goin' out without a fight. See, every time my eyes close")
        self.contentView.addSubview(label2)
        label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 10).isActive = true
        label2.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.8).isActive = true
        label2.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
    }
    
    func createLabel(text: String) -> UILabel{
        let label = UILabel()
        label.text = text
        label.numberOfLines = 0
        label.sizeToFit()
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    func initAndLoadBanner(){
        // Step 1: Create an inline adaptive banner ad size. This size is used to
        // request your adaptive banner. You can pass in the width of the device, or set
        // your own width. This example sets a static width.
        let adSize = GADCurrentOrientationInlineAdaptiveBannerAdSizeWithWidth(320)
        // Step 2: Create banner with the inline size and set ad unit ID.
        let bannerView = GADBannerView(adSize: adSize)
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.delegate = self
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        
        self.bannerView = bannerView
        
        // Step 3: Load an ad.
        let request = GADRequest()
        bannerView.load(request)
        
    }
    
    func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("bannerViewDidReceiveAd")
        self.contentView.addSubview(bannerView)
        bannerView.widthAnchor.constraint(equalToConstant: 320).isActive = true
        bannerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        bannerView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        bannerView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
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

