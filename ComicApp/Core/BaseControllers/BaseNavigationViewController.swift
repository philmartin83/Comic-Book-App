//
//  BaseNavigationViewController.swift
//  ComicApp
//
//  Created by Philip Martin on 26/10/2019.
//  Copyright © 2019 Phil Martin. All rights reserved.
//

import UIKit

class BaseNavigationViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func applyStyling(navTitle: String, shouldAddBackButton: Bool, viewController: UIViewController){
        styling()
        // check to see if we should add a back button
        if shouldAddBackButton{
            viewController.navigationItem.leftBarButtonItems = [backButton(), fixedSpacer(space: 10), navBarTitle(navTitle: navTitle)]
        }else{
            viewController.navigationItem.leftBarButtonItem = navBarTitle(navTitle: navTitle)
        }
    }
    
    //MARK:- NavBar Styling
    fileprivate func styling(){
        let navBar = self.navigationBar
        navBar.barStyle = .black // this changes the status bar colour
        navBar.shadowImage = UIImage()
        navBar.isTranslucent = false
        navBar.barTintColor = .red
    }
    
    //MARK:- Title
    fileprivate func navBarTitle(navTitle: String) -> UIBarButtonItem{
        let label = UILabel()
        label.text = navTitle
        label.textColor = .white
        label.font = UIFont(name: heroFontName, size: titleFontSize)
        label.applyShadow(shadowColour: .black)
        return UIBarButtonItem(customView: label)
    }
    
    //MARK:- Fixed space.
    fileprivate func fixedSpacer(space: CGFloat) -> UIBarButtonItem{
        let fixedSpace: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.fixedSpace, target: nil, action: nil)
        fixedSpace.width = space
        return fixedSpace
    }
    
    //MARK:- Back Button
    fileprivate func backButton() -> UIBarButtonItem{
        let backButton = UIButton(type: .custom)
        backButton.tintColor = .white
        let image = UIImageView(image: UIImage(named: "BackButton")?.withRenderingMode(.alwaysTemplate))
        image.tintColor = .white
        backButton.setImage(image.image, for: .normal)
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        backButton.applyShadow(shadowColour: .black)
        
        return UIBarButtonItem(customView: backButton)
    }
    
    //MARK:- Extension Responder
    @objc fileprivate func goBack(){
        popViewController(animated: true)
    }
    
    
}
