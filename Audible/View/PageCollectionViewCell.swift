//
//  PageCollectionViewCell.swift
//  Audible
//
//  Created by Mihail Șalari on 9/2/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit

class PageCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "\(PageCollectionViewCell.self)"
    
    var page: Page? {
        didSet {
            guard let page = page else { return }
            imageView.image = UIImage(named: page.imageName)
            let color = UIColor(white: 0.2, alpha: 1.0)
            
            let attributedText = NSMutableAttributedString(string: page.title, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 18, weight: UIFontWeightMedium), NSForegroundColorAttributeName: color])
            
            attributedText.append(NSAttributedString(string: "\n\n\(page.message)", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14, weight: UIFontWeightMedium), NSForegroundColorAttributeName: color]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            let lenght = attributedText.string.characters.count
            attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSRange(location: 0, length: lenght))
            
            textView.attributedText = attributedText
        }
    }
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .yellow
        image.image = UIImage(named: "page1")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        
        return image
    }()
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.text = "test"
        textView.isEditable = false
        textView.contentInset = UIEdgeInsetsMake(24, 0, 0, 0)
        
        return textView
    }()
    
    let lineSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        
        return view
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
    
    fileprivate func setupViews() {
        self.addSubview(imageView)
        self.addSubview(textView)
        self.addSubview(lineSeparatorView)
        
        imageView.anchorToTop(topAnchor, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor)
        textView.anchorWithConstantsToTop(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        lineSeparatorView.anchorToTop(nil, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor)
        lineSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    
}
