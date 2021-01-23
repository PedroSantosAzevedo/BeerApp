//
//  BeerListView.swift
//  BeerApp
//
//  Created by Pedro Azevedo on 23/01/21.
//

import Foundation
import UIKit

class BeerListView:UIView{
    
    lazy var tableView:UITableView = {
        let tableView = UITableView()
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(BeerListTableViewCell.self, forCellReuseIdentifier: BeerListTableViewCell.reusableIdentifier)
        tableView.estimatedRowHeight = 200
        tableView.backgroundColor = .black
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
        
        self.tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
}
