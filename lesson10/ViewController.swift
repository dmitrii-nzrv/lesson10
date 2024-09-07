//
//  ViewController.swift
//  lesson10
//
//  Created by Dmitrii Nazarov on 30.08.2024.
//

import UIKit

struct CollectionData {
    let image: String
    let name: String
    let price: String
    let date: String
    let views: String
    let number: String
    
    static func mockData() -> [CollectionData] {
        [
            CollectionData(image: "car", name: "Volvo XC90, 2020", price: "6 690 000 ₽", date: "19 апреля", views: "2823 просмотров", number: "№1122360845"),
            CollectionData(image: "car2", name: "Chery Tiggo 8, 2022", price: "8 945 434", date: "31 мая", views: "3423 просмотров", number: "№1346460845"),
            CollectionData(image: "car", name: "Volvo XC90, 2020", price: "6 690 000 ₽", date: "19 апреля", views: "2823 просмотров", number: "№1122360845"),
            CollectionData(image: "car2", name: "Chery Tiggo 8, 2022", price: "8 945 434", date: "31 мая", views: "3423 просмотров", number: "№1346460845"),CollectionData(image: "car", name: "Volvo XC90, 2020", price: "6 690 000 ₽", date: "19 апреля", views: "2823 просмотров", number: "№1122360845"),
            CollectionData(image: "car2", name: "Chery Tiggo 8, 2022", price: "8 945 434", date: "31 мая", views: "3423 просмотров", number: "№1346460845"),
            CollectionData(image: "car2", name: "Chery Tiggo 8, 2022", price: "8 945 434", date: "31 мая", views: "3423 просмотров", number: "№1346460845"),
            CollectionData(image: "car2", name: "Chery Tiggo 8, 2022", price: "8 945 434", date: "31 мая", views: "3423 просмотров", number: "№1346460845"),
            
        ]
    }
}

class ViewController: UIViewController {
    
    let cars: [ CollectionData] = CollectionData.mockData()
    
    lazy var layout: UICollectionViewFlowLayout = {
        $0.scrollDirection = .vertical
        $0.itemSize = CGSize(width: view.frame.width/2 - 17 , height: 250)
        
        $0.minimumLineSpacing = 7
        $0.minimumInteritemSpacing = 0
        
        return $0
    }(UICollectionViewFlowLayout())
    
    lazy var collectionView: UICollectionView = {
        $0.dataSource = self
        $0.contentInset = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        $0.alwaysBounceVertical = true
        $0.register(ItemCell.self, forCellWithReuseIdentifier: ItemCell.reuseId)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: layout))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        view.addSubview(collectionView)
        
        
        view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        
        
        
        ])
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         cars.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCell.reuseId, for: indexPath) as! ItemCell
        
        let item = cars[indexPath.item]
        cell.setCell(item: item)
        cell.contentView.backgroundColor = .white2
        
        
        return cell
    }
    
    
}

