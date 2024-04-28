//
//  SharedManager.swift
//  Card_test
//
//  Created by Harish on 28/04/24.
//

import Foundation
import UIKit
final class SharedManager {
    static let sharedInstance = SharedManager()
    private init(){}
    func showAlert(_ title: String, msg:String, vc: UIViewController){
        
        let alert = UIAlertController(title: title,
                                      message: msg,
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Ok",
                                       style: .default,
                                       handler: { (action:UIAlertAction) -> Void in
                                        
        })
        alert.addAction(saveAction)
        vc.present(alert, animated: true, completion: nil)
    }
}
