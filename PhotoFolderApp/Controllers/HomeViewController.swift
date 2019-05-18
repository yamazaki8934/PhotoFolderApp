//
//  HomeTableViewController.swift
//  PhotoFolderApp
//
//  Created by 山崎浩毅 on 2019/05/17.
//  Copyright © 2019 山崎浩毅. All rights reserved.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    let disposeBag = DisposeBag()
    private var personListViewModel: PersonListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        populatePeople()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.personListViewModel == nil ? 0: self.personListViewModel.peopleVM.count
    }
    
    private func populatePeople() {
        
        let resource = Resource<PersonResponse>(url: URL(string: "https://8cbe7f88.ngrok.io/api/v1/stars/index")!)
        
        URLRequest.load(resource: resource)
            .subscribe(onNext: { personResponse in
                
                let people = personResponse.people
                self.personListViewModel = PersonListViewModel(people)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }).disposed(by: disposeBag)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeViewCell", for: indexPath) as? HomeViewCell else {
            fatalError("HomeViewCell is not found")
        }
        
        let personVM = self.personListViewModel.personAt(indexPath.row)
        
        personVM.name.asDriver(onErrorJustReturn: "")
            .drive(cell.nameLabel.rx.text)
            .disposed(by: disposeBag)
        
        return cell
    }
}
