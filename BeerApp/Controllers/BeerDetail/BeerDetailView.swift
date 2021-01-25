//
//  BeerDetailView.swift
//  BeerApp
//
//  Created by Pedro Azevedo on 23/01/21.
//

import Foundation
import UIKit
import MarqueeLabel

class BeerDetailView:UIView{
    
    var imageHeight = UIScreen.main.bounds.width * 3/4 * 1.5
    
    lazy var backgroundImage:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named:"listBackground")
        addSubview(image)
        return image
    }()
    
    lazy var scrollView:UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .clear
        view.layer.zPosition = 1000
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
        scrollView.addSubview(image)
        return image
    }()
    
    lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = Theme.getFont(font: .Bohemian, size: .Title)
        label.adjustsFontSizeToFitWidth = true
        scrollView.addSubview(label)
        return label
    }()
    
    lazy var descriptionHolder:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(view)
        return view
    }()
    
    lazy var taglineLabel:MarqueeLabel = {
        let label = MarqueeLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.textColor = .black
        label.numberOfLines = 0
        label.type = .left
        label.textAlignment = .center
        label.font = Theme.getFont(font: .Default, size: .Default)
        scrollView.addSubview(label)
        label.font = label.font.withSize(18)
        
        return label
    }()

    
    lazy var descriptionLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.textColor = .black
        label.numberOfLines = 0
        label.font = Theme.getFont(font: .Default, size: .Default)
        descriptionHolder.addSubview(label)
        label.font = label.font.withSize(18)
        
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

        setTitle(for: beer)
        setImage(for: beer)
        setTagline(for: beer)
        setBitterness(for: beer)
        setAlcoholPercent(for: beer)
        setDescription(for: beer)
        setConstraints()
        
    }
    

    
    private func setTitle(for beer:Beer){
        guard let beerName = beer.name else {return}
        self.titleLabel.text = beerName
        
    }
    
    
    private func setTagline(for beer:Beer){
        guard let beerTagline = beer.tagline else {return}
        self.taglineLabel.text = beerTagline
        
    }
    
    private func setImage(for beer:Beer){
        guard let imageString = beer.image else {return}
        guard let imageUrl = URL(string: imageString) else {return}
        self.beerImage.kf.indicatorType = .activity
        self.beerImage.kf.setImage(with: imageUrl)
    }
    
    private func setBitterness(for beer:Beer){
        guard let bitterness = beer.bitterness else {return}
        let imageAndLabelView = ImageAndLabelView(imageName: "hop", title: String(bitterness))
        
        imageAndLabelView.backgroundColor = .clear
        stackView.addArrangedSubview(imageAndLabelView)
        imageAndLabelView.translatesAutoresizingMaskIntoConstraints = false
        
        imageAndLabelView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        imageAndLabelView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true

    }
    
    private func setDescription(for beer:Beer){
        guard let beerDescription = beer.description else {return}
       
        descriptionLabel.text = beerDescription

    }
    
    private func setAlcoholPercent(for beer:Beer){
        guard let alcohol = beer.alcoholPercentage else {return}
        let imageAndLabelView = ImageAndLabelView(imageName: "alcoholPercent", title: String(alcohol))
        imageAndLabelView.backgroundColor = .clear

        stackView.addArrangedSubview(imageAndLabelView)
        imageAndLabelView.translatesAutoresizingMaskIntoConstraints = false
        
        imageAndLabelView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        imageAndLabelView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true

    }
    
    
    private func setConstraints(){
        
        self.backgroundImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        self.backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        self.backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        self.backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
        titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: 16).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        
        beerImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant:16).isActive = true
        beerImage.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        beerImage.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
        beerImage.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        beerImage.heightAnchor.constraint(equalToConstant: imageHeight).isActive = true
        
        taglineLabel.topAnchor.constraint(equalTo: beerImage.bottomAnchor,constant: 16).isActive = true
        taglineLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        taglineLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        
        stackView.topAnchor.constraint(equalTo: taglineLabel.bottomAnchor,constant: 8).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true

        
        
        
       
        
        descriptionLabel.topAnchor.constraint(equalTo:descriptionHolder.topAnchor ).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: descriptionHolder.leadingAnchor,constant: 16).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: descriptionHolder.trailingAnchor,constant: -16).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo:descriptionHolder.bottomAnchor ).isActive = true
        descriptionLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        descriptionLabel.layoutIfNeeded()
        

            
        descriptionHolder.topAnchor.constraint(equalTo: stackView.bottomAnchor,constant: 8).isActive = true
        descriptionHolder.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        descriptionHolder.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        descriptionHolder.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor,constant: -16).isActive = true
    
        stackView.layoutIfNeeded()
        
    }
    
    
}

