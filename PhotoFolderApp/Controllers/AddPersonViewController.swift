//
//  AddPersonViewController.swift
//  PhotoFolderApp
//
//  Created by 山崎浩毅 on 2019/05/18.
//  Copyright © 2019 山崎浩毅. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import Alamofire

final class AddPersonViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBAction func save() {
        guard let name = self.nameTextField.text else {
            return 
        }
        
        let person = Person(name: name)
        
        StockStars.postStar(person: person)
    }
    
}
