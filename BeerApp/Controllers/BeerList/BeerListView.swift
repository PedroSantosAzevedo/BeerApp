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
    
    
    lazy var errorLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.minimumScaleFactor = 0.6
        label.numberOfLines = 5
        label.lineBreakMode = .byTruncatingHead
        label.textColor = .black
        label.textAlignment = .center
        label.isHidden = true
        label.text = "Algo inesperado aconteceu"
        label.font = Theme.getFont(font: .Bohemian, size: .Title)
        
        addSubview(label)
        return label
    }()
    
    lazy var reloadButton:UIButton = {
        let button = UIButton()
        button.setTitle("Tentar novamente", for: .normal)
        button.tintColor = .black
        button.backgroundColor = UIColor.white.withAlphaComponent(0.6)
        button.setTitleColor(.black, for: .normal)
        button.isHidden = true
        button.bringSubviewToFront(backgroundImage)
        button.borderWithColor(.black, width: 2)
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var tableView:UITableView = {
        let tableView = UITableView()
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(BeerListTableViewCell.self, forCellReuseIdentifier: BeerListTableViewCell.reusableIdentifier)
        tableView.register(LoadingTableViewCell.self, forCellReuseIdentifier: LoadingTableViewCell.reusableIdentifier)
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
        
        self.reloadButton.centerXAnchor.constraint(equalTo:backgroundImage.centerXAnchor ).isActive = true
        self.reloadButton.centerYAnchor.constraint(equalTo:backgroundImage.centerYAnchor ).isActive = true
        self.reloadButton.heightAnchor.constraint(equalToConstant: 72).isActive = true
        self.reloadButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 3/4).isActive = true
        
        
        self.errorLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        self.errorLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        self.errorLabel.bottomAnchor.constraint(equalTo:reloadButton.topAnchor,constant: -16 ).isActive = true
        self.errorLabel.centerXAnchor.constraint(equalTo:backgroundImage.centerXAnchor ).isActive = true
        
        
        self.tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
}
