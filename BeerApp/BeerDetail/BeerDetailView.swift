//
//  BeerDetailView.swift
//  BeerApp
//
//  Created by Pedro Azevedo on 23/01/21.
//

import Foundation
import UIKit

class BeerDetailView:UIView{
    
    var imageHeight = UIScreen.main.bounds.width * 3/4
    
    lazy var scrollView:UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }()
    
    lazy var stackView:UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stack)
        return stack
    }()
    
    lazy var beerImage:UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true;
        return image
    }()
    
    lazy var descriptionHolder:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    lazy var descriptionLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        descriptionHolder.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        self.backgroundColor = .purple
        
    }
    override func layoutSubviews() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setUp(beer:Beer){
        setImage(for: beer)
        setBitterness(for: beer)
        setAlcoholPercent(for: beer)
        setDescription(for: beer)
        setConstraints()
        
    }
    
    
    private func setImage(for beer:Beer){
        guard let imageString = beer.image else {return}
        guard let imageUrl = URL(string: imageString) else {return}
        self.beerImage.kf.indicatorType = .activity
        self.beerImage.kf.setImage(with: imageUrl)
        
        stackView.addArrangedSubview(beerImage)
        
    }
    
    private func setBitterness(for beer:Beer){
        guard let bitterness = beer.bitterness else {return}
        let imageAndLabelView = ImageAndLabelView(imageName: "", title: String(bitterness))
        stackView.addArrangedSubview(imageAndLabelView)
        imageAndLabelView.translatesAutoresizingMaskIntoConstraints = false
        
        imageAndLabelView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        imageAndLabelView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true

    }
    
    private func setDescription(for beer:Beer){
        guard let beerDescription = beer.description else {return}
       
        descriptionLabel.text = beerDescription
        
        stackView.addArrangedSubview(descriptionHolder)
        
    }
    
    private func setAlcoholPercent(for beer:Beer){
        guard let alcohol = beer.alcoholPercentage else {return}
        let imageAndLabelView = ImageAndLabelView(imageName: "", title: String(alcohol))
        stackView.addArrangedSubview(imageAndLabelView)
        imageAndLabelView.translatesAutoresizingMaskIntoConstraints = false
        
        imageAndLabelView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        imageAndLabelView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true

    }
    
    
    private func setConstraints(){
        
        scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        beerImage.topAnchor.constraint(equalTo: stackView.topAnchor).isActive = true
        beerImage.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        beerImage.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
        beerImage.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        beerImage.heightAnchor.constraint(equalToConstant: imageHeight).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo:descriptionHolder.topAnchor ).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: descriptionHolder.leadingAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: descriptionHolder.trailingAnchor).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo:descriptionHolder.bottomAnchor ).isActive = true
        
        
        descriptionHolder.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        descriptionHolder.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
    
        stackView.layoutIfNeeded()
        
    }
    
    
}

