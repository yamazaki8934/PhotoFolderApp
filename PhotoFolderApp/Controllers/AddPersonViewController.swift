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
    
    // 一番基本的なイベントの発生方法
    private let personSubject = PublishSubject<Person>()
    
    // Observableとして外部に公開（上のSubject自体を公開すると外部からonNextなどを呼び出せてしまうためカプセル化を崩してしまう）
    var personSubjectObsevable: Observable<Person> {
        return personSubject.asObservable()
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBAction func save() {
        guard let name = self.nameTextField.text else {
            return 
        }
        
        let person = Person(name: name)
        
        StockStars.postStar(person: person)
        
        // ここでonNext流して値が更新されたイベントを通知（送信）
        personSubject.onNext(person)
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
