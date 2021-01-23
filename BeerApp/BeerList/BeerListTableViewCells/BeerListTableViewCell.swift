//
//  BeerListTableViewCell.swift
//  BeerApp
//
//  Created by Pedro Azevedo on 23/01/21.
//

import Foundation
import UIKit
import MarqueeLabel
import Kingfisher


class BeerListTableViewCell:UITableViewCell{
    
    //MARK:- Variables
    static let reusableIdentifier = "BeerListTableViewCell"
    
    //MARK:- Views
    
    lazy var containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.roundCorner(radius: 4)
        view.borderWithColor(.yellow, width: 2)
        contentView.addSubview(view)
        return view
    }()
    
    lazy var beerImage:UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true;
        containerView.addSubview(image)
        return image
    }()
    
    lazy var textContainerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .brown
        view.roundCorner(radius: 4)
        view.borderWithColor(.brown, width: 4)
        containerView.addSubview(view)
        return view
    }()
    
    
    lazy var titleLabel:MarqueeLabel = {
        let label = MarqueeLabel(frame: .zero, duration: 6, fadeLength: 5)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.textColor = .white
        label.font = label.font.withSize(18)
        label.adjustsFontSizeToFitWidth = true
        label.type = .left
        textContainerView.addSubview(label)
        return label
    }()
    
    lazy var alcoholLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.minimumScaleFactor = 0.6
        label.numberOfLines = 5
        label.lineBreakMode = .byTruncatingHead
        label.textColor = .white
        label.font = label.font.withSize(17)
        label.adjustsFontSizeToFitWidth = true
        textContainerView.addSubview(label)
        return label
    }()
    
    
    //MARK:- Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setContraints()
        self.selectionStyle = .none
  
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUp(beer:Beer){
        getImage(for:beer)
        getTitle(for:beer)
        getAlcohol(for:beer)
    }

    private func getImage(for beer:Beer){

        let imageString = beer.image
        guard let imageUrl = URL(string: imageString) else {return}
        self.beerImage.kf.indicatorType = .activity
        self.beerImage.kf.setImage(with: imageUrl)
 
    }
    
    private func getTitle(for beer:Beer){
//        self.titleLabel.text = beer.name
        self.titleLabel.text = "init(coder:) has not been implementedinit(coder:) has not been implemented"
    }
    
    private func getAlcohol(for beer:Beer){
        self.alcoholLabel.text = "\(beer.alcoholPercentage)%"
        
    }
}
//MARK:- Constraints
extension BeerListTableViewCell{
    func setContraints(){
        
        let viewWidth = UIScreen.main.bounds.width
        let imageHeight = viewWidth * 3/4
        
        self.containerView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 16).isActive = true
        self.containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16).isActive = true
        self.containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16).isActive = true
        self.containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -16).isActive = true
        
        self.beerImage.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        self.beerImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        self.beerImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        self.beerImage.heightAnchor.constraint(equalToConstant: imageHeight).isActive = true
        
        
        self.textContainerView.topAnchor.constraint(equalTo: beerImage.bottomAnchor).isActive = true
        self.textContainerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 3).isActive = true
        self.textContainerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -3).isActive = true
        self.textContainerView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -2).isActive = true
        
        
        self.titleLabel.topAnchor.constraint(equalTo: textContainerView.topAnchor,constant: 16).isActive = true
        self.titleLabel.leadingAnchor.constraint(equalTo: textContainerView.leadingAnchor,constant: 16).isActive = true
        self.titleLabel.trailingAnchor.constraint(equalTo: textContainerView.trailingAnchor,constant: -16).isActive = true
        
        self.alcoholLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 8).isActive = true
        self.alcoholLabel.leadingAnchor.constraint(equalTo: textContainerView.leadingAnchor,constant: 16).isActive = true
        self.alcoholLabel.trailingAnchor.constraint(equalTo: textContainerView.trailingAnchor,constant: -16).isActive = true
        self.alcoholLabel.bottomAnchor.constraint(equalTo: textContainerView.bottomAnchor,constant: -16).isActive = true
    }
}
