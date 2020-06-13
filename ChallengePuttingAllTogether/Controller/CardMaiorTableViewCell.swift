//
//  RecomendadoTableViewCell.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 13/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class CardMaiorTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    
       static let identifier = "CardMaiorTableViewCell"
        
        override func awakeFromNib() {
            super.awakeFromNib()
            collectionView.delegate = self
            collectionView.dataSource = self
            // Initialization code
            
            collectionView.showsHorizontalScrollIndicator = false
               
           collectionView.register(CardMaiorCollectionViewCell.xibForCollection(), forCellWithReuseIdentifier: CardMaiorCollectionViewCell.identifier)
        }

  

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension CardMaiorTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardMaiorCollectionViewCell.identifier, for: indexPath) as? CardMaiorCollectionViewCell else{
             fatalError("Wrong identifier")
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          return CGSize(width: 364, height: 200)
      }

}


