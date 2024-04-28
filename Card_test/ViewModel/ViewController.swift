//
//  SharedManager.swift
//  Card_test
//
//  Created by Harish on 28/04/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var submitButton: UIButton!
    @IBOutlet var collectionView: UICollectionView!
    
    var cards: [Card] = []
    var redCardIndex: Int?
    var gameOver = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib.init(nibName: "CardCell", bundle: nil), forCellWithReuseIdentifier: "CardCell")


    }
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        guard let inputValue = inputTextField.text,
              let number = Int(inputValue),
              number > 0,
              Int(sqrt(Double(number))) * Int(sqrt(Double(number))) == number
        else {
            if inputTextField.text == ""{
                SharedManager.sharedInstance.showAlert("Input Filed Empty!", msg: "Please enter number", vc: self)
                return
            }
            SharedManager.sharedInstance.showAlert("Not Vaild Number!", msg: "Please enter a valid square number.", vc: self)
            return
        }
        
        let rows = Int(sqrt(Double(number)))
        let cols = rows
        generateCards(rows: rows, cols: cols)
        collectionView.reloadData()
    }
    
    func generateCards(rows: Int, cols: Int) {
        cards = Array(repeating: Card(color: .gray, isClickable: false), count: rows * cols)
        redCardIndex = Int.random(in: 0..<cards.count)
        cards[redCardIndex!].color = .red
        cards[redCardIndex!].isClickable = true
        gameOver = false
    }
    
}





