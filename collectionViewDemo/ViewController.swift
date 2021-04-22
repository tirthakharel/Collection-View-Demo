//
//  ViewController.swift
//  collectionViewDemo
//
//  Created by Tirtha Kharel on 4/22/21.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.collectionViewLayout = createLayout()
    }
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        
        let layout = UICollectionViewCompositionalLayout { sectionIndex, environment -> NSCollectionLayoutSection? in
            
            if sectionIndex == 0 {
                
                let itemSize = NSCollectionLayoutSize (
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .estimated(250)
                )
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize (
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .estimated(250)
                )
                
                let columns = environment.container.contentSize.width > 500 ? 2 : 1
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: columns)
                
                
                group.interItemSpacing = .fixed(20)
                
                if columns > 1 {
                    group.contentInsets.leading = 20
                    group.contentInsets.trailing = 20
                }
                
                
                let section = NSCollectionLayoutSection(group: group)
                
                section.interGroupSpacing = 20
                section.contentInsets.top = 20
                
                return section
            }
            
            let itemSize = NSCollectionLayoutSize (
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(0.3)
            )
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize (
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(250)
            )
            
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
            
            group.interItemSpacing = .flexible(10)
            
            let section = NSCollectionLayoutSection(group: group)
            
            section.interGroupSpacing = 50
            
            section.orthogonalScrollingBehavior = .groupPaging
            
            return section
        }
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 25
        
        layout.configuration = config
        return layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "example", for: indexPath) as! MyCollectionViewCell
        
        print(indexPath.item)
        cell.backgroundColor = .red
        cell.label.text = String(indexPath.item)
        
        
        return cell
    }
    
    
}

