//
//  ActivityIndicator.swift
//  ComicApp
//
//  Created by Philip Martin on 13/10/2019.
//  Copyright © 2019 Phil Martin. All rights reserved.
//

import UIKit

final class ActivityIndicator{
    
    var activityIndicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(style: .large)
        activity.translatesAutoresizingMaskIntoConstraints = false
        return activity
    }()
    
    func displayActivity(view: UIView){
        view.addSubview(activityIndicator)
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    
    func startAanimating(){
        activityIndicator.startAnimating()
    }
    
    func stopAnimating(){
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }
}
