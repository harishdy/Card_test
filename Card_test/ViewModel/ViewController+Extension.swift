//
//  ViewController+Extension.swift
//  Card_test
//
//  Created by Harish on 28/04/24.
//

import Foundation
import UIKit

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCell
        cell.backgroundColor = cards[indexPath.item].color
        if gameOver && indexPath.item == cards.count - 1 {
             cell.backgroundColor = .green // Set the last cell to green when game is over
         }
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard cards[indexPath.item].isClickable else { return }
        
        cards[indexPath.item].color = .green
        if cards.allSatisfy({ $0.color == .green }) {
            gameOver = true
            SharedManager.sharedInstance.showAlert("!Yap! All cards are green", msg: "You won the Game", vc: self)

            
        }else{
            
            
            redCardIndex = Int.random(in: 0..<cards.count)
            cards[redCardIndex!].color = .red
            cards[redCardIndex!].isClickable = true
        }
        collectionView.reloadData()
        
      
    }

}
