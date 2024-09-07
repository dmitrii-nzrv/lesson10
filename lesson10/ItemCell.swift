//
//  ItemCell.swift
//  lesson10
//
//  Created by Dmitrii Nazarov on 07.09.2024.
//

import UIKit



class ItemCell: UICollectionViewCell {
    
    static let reuseId = "itemCell"
    
    lazy var imageView: UIImageView = {
        $0.image = .car
        $0.backgroundColor = .red
        $0.frame.origin = .zero
        $0.frame.size = CGSize(width: contentView.frame.width, height: 200)
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        return $0
    }(UIImageView())
    
    lazy var hStack: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
        $0.alignment = .fill
        $0.frame.origin = CGPoint(x: 10, y: imageView.bounds.maxY + 8)
        $0.frame.size = CGSize(width: contentView.frame.width - 20, height: 18)
        
//        $0.addArrangedSubview(nameLabel)
//        $0.addArrangedSubview(priceLabel)
        
        return $0
    }(UIStackView())
    
    lazy var nameLabel: UILabel = createLabel("Volvo XC90, 2020", font: .systemFont(ofSize: 12), color: .black)
    
    lazy var priceLabel: UILabel = createLabel("6 690 000 ₽", font: .systemFont(ofSize: 12), color: .black)
    
    lazy var hStackTwo: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
        $0.alignment = .center
        
        $0.frame.origin = CGPoint(x: 10, y: hStack.frame.maxY)
        $0.frame.size = CGSize(width: contentView.frame.width / 2 + 70, height: 18)
        
//        $0.addArrangedSubview(nameLabel)
//        $0.addArrangedSubview(priceLabel)
        
        return $0
    }(UIStackView())
    
    lazy var dateLabel: UILabel = createLabel("19 апреля", font: .systemFont(ofSize: 7), color: .black)
    
    lazy var viewsLabel: UILabel = createLabel("2823 просмотров", font: .systemFont(ofSize: 7), color: .black)
    
    lazy var numLabel: UILabel = createLabel("№1122360845", font: .systemFont(ofSize: 7), color: .black)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        hStack.addArrangedSubview(nameLabel)
        hStack.addArrangedSubview(priceLabel)
        
        contentView.layer.cornerRadius = 10
        contentView.addSubview(imageView)
        contentView.addSubview(hStack)
        contentView.backgroundColor = .blue
        
        hStackTwo.addArrangedSubview(dateLabel)
        hStackTwo.addArrangedSubview(viewsLabel)
        hStackTwo.addArrangedSubview(numLabel)
        contentView.addSubview(hStackTwo)
        
      
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private methods
    
    func setCell(item: CollectionData) {
        imageView.image = UIImage(named: item.image)
        nameLabel.text = item.name
        priceLabel.text = item.price
        dateLabel.text = item.date
        viewsLabel.text = item.views
        numLabel.text = item.number
    }
    
    private func createLabel(_ text: String, font: UIFont, color: UIColor, frame: CGRect = .zero) -> UILabel{
        {
            $0.text = text
            $0.font = font
            $0.textColor = color
            $0.numberOfLines = 1
            $0.clipsToBounds = true
            $0.lineBreakMode = .byWordWrapping
            return $0
        }(UILabel(frame: frame))
    }
}
