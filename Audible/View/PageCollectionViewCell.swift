//
//  PageCollectionViewCell.swift
//  Audible
//
//  Created by Mihail Șalari on 9/2/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit

class PageCollectionViewCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .yellow
        image.image = UIImage(named: "page1")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        
        return image
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupViews()
    }
    
    
    // MARK: - Setup Views
    
    func setupViews() {
        self.addSubview(imageView)
        imageView.anchorToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    }
    
    
}
