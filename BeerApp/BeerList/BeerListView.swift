//
//  BeerListView.swift
//  BeerApp
//
//  Created by Pedro Azevedo on 23/01/21.
//

import Foundation
import UIKit

class BeerListView:UIView{
    
    
    lazy var backgroundImage:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named:"listBackground")
        addSubview(image)
        return image
    }()
    
    
    lazy var tableView:UITableView = {
        let tableView = UITableView()
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(BeerListTableViewCell.self, forCellReuseIdentifier: BeerListTableViewCell.reusableIdentifier)
        tableView.estimatedRowHeight = 200
        tableView.layer.zPosition = 10000
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        self.backgroundColor = .purple
        
    }
    override func layoutSubviews() {
        setContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setContraints(){
        
        
        self.backgroundImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        self.backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        self.backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        self.backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        self.tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
}
