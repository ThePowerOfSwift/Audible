//
//  ViewController.swift
//  Audible
//
//  Created by Mihail Șalari on 9/2/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    fileprivate lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0.0
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor =  .white //UIColor(red: 255/255.0, green: 125/255.0, blue: 0/255.0, alpha: 1.0)
        collection.delegate = self
        collection.dataSource = self
        collection.isPagingEnabled = true
        
        return collection
    }()
    
    let pages: [Page] = {
        let firstPage = Page(title: "Share a great listen",
                             message: "It's free to send your books to the people in your life. Every recipient's first book is on us.",
                             imageName: "page1")
        
        let secondPage = Page(title: "Send from your library",
                              message: "Tap the More menu next to any book. Choose \"Send this Book\"",
                              imageName: "page2")
        
        let thirdPage = Page(title: "Send from the player",
                             message: "Tap the More menu in the upper corner. Choose \"Send this Book\"",
                             imageName: "page3")
        
        
        return [firstPage, secondPage, thirdPage]
    }()
    
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.numberOfPages = 3
        pageControl.currentPageIndicatorTintColor = Constants.Color
        
        return pageControl
    }()
    
    let skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Skip", for: .normal)
        button.setTitleColor( Constants.Color, for: .normal)
        
        return button
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("next", for: .normal)
        button.setTitleColor( Constants.Color, for: .normal)
        
        return button
    }()
    
    
    // MARK: - LyfeCicle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        view.addSubview(skipButton)
        view.addSubview(nextButton)
        
        
         _ = pageControl.anchor(nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 40)
        
        
        _ = skipButton.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 16, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 50)
        
        _ = nextButton.anchor(view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, topConstant: 16, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 50)
        
        //
        collectionView.register(PageCollectionViewCell.self,
                                forCellWithReuseIdentifier: PageCollectionViewCell.reuseIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Layout
    
    override func viewWillLayoutSubviews() {
        collectionView.frame = view.frame
    }
}


// MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PageCollectionViewCell.reuseIdentifier,
                                                      for: indexPath) as! PageCollectionViewCell
        let page = pages[indexPath.item]
        cell.page = page
        
        return cell
    }
}


// MARK: - UICollectionViewDelegate

extension MainViewController: UICollectionViewDelegate {
    
}


// MARK: - UICollectionViewDelegateFlowLayout

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
