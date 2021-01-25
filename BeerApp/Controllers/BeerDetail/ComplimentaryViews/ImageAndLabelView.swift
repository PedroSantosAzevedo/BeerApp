//
//  ImageAndLabelView.swift
//  BeerApp
//
//  Created by Pedro Azevedo on 24/01/21.
//

import Foundation
import UIKit
import MarqueeLabel

class ImageAndLabelView:UIView{
    
    lazy var imageView:UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        image.tintColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        addSubview(image)
        return image
    }()
    
    lazy var titleLabel:MarqueeLabel = {
        let label = MarqueeLabel(frame: .zero, duration: 6, fadeLength: 5)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.textColor = .black
        label.font = Theme.getFont(font: .Default, size: .Default)
        label.adjustsFontSizeToFitWidth = true
        label.type = .left
        addSubview(label)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.backgroundColor = .white
    }
    override func layoutSubviews() {
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    convenience init(imageName:String,title:String) {
        self.init()
        self.backgroundColor = .white
        setConstraints()
        setImage(imageName)
        setTitle(title)
    }
    
    private func setImage( _ imageName:String) {
        self.imageView.image = UIImage(named: imageName)
    }
    
    private func setTitle(_ title: String) {
        self.titleLabel.text = title
    }
    
    private func setConstraints(){
        
        imageView.topAnchor.constraint(equalTo: topAnchor,constant: 8).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 8).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -8).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 32).isActive = true
        
        titleLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor,constant: 8).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -8).isActive = true
        
        
        
        
    }
    
}
