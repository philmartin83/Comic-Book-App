//
//  CharacterDetailTableViewDelegate.swift
//  ComicApp
//
//  Created by Philip Martin on 29/09/2019.
//  Copyright © 2019 Phil Martin. All rights reserved.
//

import UIKit

class CharacterDetailTableViewDelegate: NSObject, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1{
            return setupSectionHeader(title: "Character Bio", tableView: tableView)
        }
        
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1{
            return 60
        }
        return 0
    }
    
    //AMRK:- Helper
    
    func setupSectionHeader(title: String, tableView: UITableView) -> UIView{
       let headerView = UIView()
       headerView.backgroundColor = .red
       headerView.translatesAutoresizingMaskIntoConstraints = false
       headerView.leadingAnchor.constraint(equalTo: tableView.leadingAnchor).isActive = true
       headerView.trailingAnchor.constraint(equalTo: tableView.trailingAnchor).isActive = true
       headerView.heightAnchor.constraint(equalToConstant: 60).isActive = true
       
       let titleForHeaderView = UILabel()
       headerView.addSubview(titleForHeaderView)
       titleForHeaderView.font = UIFont(name: heroFontName, size: 17)
       titleForHeaderView.text = title
       titleForHeaderView.textColor = .white
       titleForHeaderView.translatesAutoresizingMaskIntoConstraints = false
       titleForHeaderView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10).isActive = true
       titleForHeaderView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20).isActive = true
        
       return headerView
    }
}
