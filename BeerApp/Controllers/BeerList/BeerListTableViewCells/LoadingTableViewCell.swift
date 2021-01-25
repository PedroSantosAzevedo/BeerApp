//
//  LoadingTableViewCell.swift
//  BeerApp
//
//  Created by Pedro Azevedo on 25/01/21.
//

import Foundation
import UIKit

class LoadingTableViewCell:UITableViewCell{
    
    static let reusableIdentifier = "LoadingTableViewCell"
    
    lazy var activityIndicator:UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.color = .black
        contentView.addSubview(indicator)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        
        return indicator
    }()
    
    //MARK:- Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.white.withAlphaComponent(0.7)
        setContraints()
        self.selectionStyle = .none
  
    }
    
    func setUp(){
        activityIndicator.startAnimating()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setContraints(){
        
        activityIndicator.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 16).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        activityIndicator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -16).isActive = true
        
        
    }
    
}
