//
//  StockRankViewController.swift
//  StockRank
//
//  Created by 신희권 on 2023/01/08.
//

import UIKit

class StockRankViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    let stockList: [StockModel] = StockModel.list
    
    //Data, Presentaion,Layout
    // Data - 어떤 데이터 ?
    // Presentation - 셀을 어떻게 표현?
    // Layout - 셀을 어떻게 배치?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
     
    }
  
}
extension StockRankViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stockList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StockRankCollectionViewCell", for: indexPath) as? StockRankCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let stock = stockList[indexPath.item]
        cell.configure(stock)
        return cell
        
        
        
    }
    
    
}

extension StockRankViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // width == collectionView
         // height 80
        
        return CGSize(width: collectionView.bounds.width, height: 80)
    }
    
}
