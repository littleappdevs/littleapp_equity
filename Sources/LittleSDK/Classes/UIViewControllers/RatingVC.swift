//
//  RatingVC.swift
//  Little
//
//  Created by Gabriel John on 08/06/2019.
//  Copyright © 2019 Craft Silicon Ltd. All rights reserved.
//

import UIKit

public class RatingVC: UIViewController, UITextViewDelegate, SDKRatingViewDelegate {
    
    var driverImage: String?
    var driverName: String?
    
    var isMerchant: Bool = false
    
    var sdkBundle: Bundle?
    
    @IBOutlet weak var lblDriverName: UILabel!
    @IBOutlet weak var imgDriverImage: UIImageView!
    
    @IBOutlet weak var lblPlaceHolder: UILabel!
    @IBOutlet weak var txtCommentsShared: UITextView!
    
    @IBOutlet weak var floatRatingView: SDKRatingView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white.withAlphaComponent(0.75)
        
        sdkBundle = Bundle.module
        
        lblDriverName.text = "Rate \((driverName ?? "").capitalized)"
        imgDriverImage.sd_setImage(with: URL(string: driverImage ?? ""), placeholderImage: getImage(named: "default", bundle: sdkBundle!))
        lblPlaceHolder.text = "Share your experience you had with \((driverName ?? "").capitalized) to help us serve you better and improve our services (Optional)"
        
        setupFloatRatingView()
        
        showAnimate()
    }
    
    public func setupFloatRatingView() {
        
        // Required float rating view params
        
        floatRatingView.emptyImage = getImage(named: "star_empty", bundle: sdkBundle!)
        floatRatingView.fullImage = getImage(named: "star_full", bundle: sdkBundle!)
        
        // Optional params
        floatRatingView.delegate = self
        floatRatingView.contentMode = UIView.ContentMode.scaleAspectFit
        floatRatingView.maxRating = 5
        floatRatingView.minRating = 1
        floatRatingView.rating = 0
        floatRatingView.editable = true
        floatRatingView.halfRatings = true
        floatRatingView.floatRatings = false
        
    }
    
    @IBAction func btnSubmitRating(_ sender: UIButton) {
        if self.floatRatingView.rating > 0 {
            let dic = ["data": "\(NSString(format: "%.1f", self.floatRatingView.rating)):::\(txtCommentsShared.text!)"]
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "RATECANCEL"), object: nil, userInfo: dic)
            removeAnimate()
        } else {
            showAlerts(title: "", message: "Kindly ensure you rate \((driverName ?? "").capitalized) to proceed.")
        }
    }
    
    @IBAction func btnCancel(_ sender: UIButton) {
        let dic = ["data": ""]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "RATECANCEL"), object: nil, userInfo: dic)
        removeAnimate()
    }
    
    public func textViewDidBeginEditing(_ textView: UITextView) {
        lblPlaceHolder.isHidden = true
    }
    
    public func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text != "" {
            lblPlaceHolder.isHidden = true
        } else {
            lblPlaceHolder.isHidden = false
        }
    }
    
    public func floatRatingView(_ ratingView: SDKRatingView, didUpdate rating: Float) {
        printVal(object: NSString(format: "%.1f", self.floatRatingView.rating) as String)
    }
    
    func showAnimate(){
        self.view.alpha = 0.25
        self.view.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        CATransaction.begin()
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: [.beginFromCurrentState, .curveLinear, .allowUserInteraction], animations: {
              self.view.transform = CGAffineTransform.identity
        }, completion: nil)
        UIView.animate(withDuration: 0.3 * 0.5, delay: 0, options: [.beginFromCurrentState, .curveLinear, .allowUserInteraction], animations: {
            self.view.alpha = 1
        }, completion: nil)
        CATransaction.commit()
    }

    @objc func removeAnimate() {
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            self.view.alpha = 1
            self.view.transform = CGAffineTransform.identity
        }
        UIView.animate(withDuration: 0.15, delay: 0, options: [.beginFromCurrentState, .curveEaseIn, .allowUserInteraction], animations: {
            self.view.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }, completion: nil)
        UIView.animate(withDuration: 0.15, delay: 0, options: [.beginFromCurrentState, .curveEaseIn, .allowUserInteraction], animations: {
            self.view.alpha = 0
        }, completion: {(finished: Bool) in if (finished) {
            NotificationCenter.default.removeObserver(self, name:NSNotification.Name(rawValue: "CloseCreate"), object: nil)
            self.view.removeFromSuperview()
        }
        })
        CATransaction.commit()
    }
}
