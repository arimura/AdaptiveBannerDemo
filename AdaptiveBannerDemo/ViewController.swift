//
//  ViewController.swift
//  AdaptiveBannerDemo
//
//  Created by k-arimura on 2022/04/13.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController, GADBannerViewDelegate{
    
    @IBOutlet weak var contentView: UIView!
    var bannerView :GADBannerView!
    var timer :Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label1 = createLabel(text: "We are about to study the idea of a computational process. Computational processes are abstract beings that inhabit computers. As they evolve, processes manipulate other abstract things called data. The evolution of a process is directed by a pattern of rules called a program. People create programs to direct processes. In effect, we conjure the spirits of the computer with our spells.")
        self.contentView.addSubview(label1)
        label1.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        label1.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        label1.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.8).isActive = true
        
        
        let banner = createBanner()
        self.bannerView = banner
        self.contentView.addSubview(banner)
        banner.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 10).isActive = true
        banner.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        banner.widthAnchor.constraint(equalToConstant: 320).isActive = true
        
        let label2 = createLabel(text: "A computational process is indeed much like a sorcerer's idea of a spirit. It cannot be seen or touched. It is not composed of matter at all. However, it is very real. It can perform intellectual work. It can answer questions. It can affect the world by disbursing money at a bank or by controlling a robot arm in a factory. The programs we use to conjure processes are like a sorcerer's spells. They are carefully composed from symbolic expressions in arcane and esoteric programming languages that prescribe the tasks we want our processes to perform.")
        self.contentView.addSubview(label2)
        label2.topAnchor.constraint(equalTo: banner.bottomAnchor, constant: 10).isActive = true
        label2.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.8).isActive = true
        label2.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { Timer in
            let request = GADRequest()
            self.bannerView.load(request)
        })
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
    
    func createBanner() -> GADBannerView {
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
        return bannerView
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

