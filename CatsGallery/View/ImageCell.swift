//
//  ImageCell.swift
//  CatsGallery
//
//  Created by Jackson Matheus on 03/10/23.
//

import Foundation
import UIKit

class ImageCell: UICollectionViewCell {
    static let identifier = "image_cell"
    
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        
        return iv
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        self.backgroundColor = .white
        
        setupShadowEffect()
        
        self.layer.cornerRadius = 10
        self.layer.shouldRasterize = true
        self.clipsToBounds = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
    
    private func setupShadowEffect(){
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 10.0
        self.layer.shadowOffset =  .zero
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    }
    
    
    private func setupImage(){
        let padding: CGFloat = 7.5
        
        
        contentView.addSubview(imageView)
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: padding).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding).isActive = true
        
        imageView.layer.cornerRadius = 5.0
        imageView.layer.masksToBounds  = true
    }
    
}