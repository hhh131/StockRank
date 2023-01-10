//
//  StockRankCollectionViewCell.swift
//  StockRank
//
//  Created by 신희권 on 2023/01/11.
//

import UIKit

class StockRankCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var heartImg: UIImageView!
    @IBOutlet var rankLabel: UILabel!
    @IBOutlet var diffLabel: UILabel!
    @IBOutlet var companyPriceLabel: UILabel!
    @IBOutlet var companyName: UILabel!
    @IBOutlet var companyImg: UIImageView!
    
    
    
    
    
    func configure(_ stock: StockModel){
        
        
    
        rankLabel.text =  "\(stock.rank)"
        companyImg.image = UIImage(named: stock.imageName)
        companyName.text = "\(stock.name)"
        companyPriceLabel.text = "\(convertToCurrencyFormat(price: stock.price)) 원"
        
        
        
        diffLabel.textColor = stock.diff > 0 ? UIColor.systemRed : UIColor.systemBlue
        diffLabel.text = "\(stock.diff)%"
        
     
        func convertToCurrencyFormat(price : Int) -> String{
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            numberFormatter.maximumFractionDigits = 0
            let result = numberFormatter.string(from: NSNumber(value: price)) ?? ""
            return result
        }
    }
}
