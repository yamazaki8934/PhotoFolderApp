//
//  PersonViewModel.swift
//  PhotoFolderApp
//
//  Created by 山崎浩毅 on 2019/05/18.
//  Copyright © 2019 山崎浩毅. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct PersonListViewModel {
    let peopleVM: [PersonViewModel]
}

extension PersonListViewModel {
    
    init(_ people: [Person]) {
        self.peopleVM = people.compactMap(PersonViewModel.init)
    }
    
}

extension PersonListViewModel {
    
    func personAt(_ index: Int) -> PersonViewModel {
        return self.peopleVM[index]
    }
    
}

struct PersonViewModel {
    
    let person: Person
    
    init(_ person: Person) {
        self.person = person
    }
    
}

extension PersonViewModel {
    
    var name: Observable<String> {
        return Observable<String>.just(person.name)
    }
    
}
