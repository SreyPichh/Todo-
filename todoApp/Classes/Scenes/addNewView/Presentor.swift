//
//  Presentor.swift
//  todoApp
//
//  Created by Pich on 2/21/19.
//  Copyright © 2019 pich. All rights reserved.
//

import RealmSwift

class Presentor {
    var router: AddListRoute?
    init(router: AddListRoute) {
        self.router = router
    }
    
    func storeRequest(task: String, id: Int) -> Void  {
        router?.addBtn_navigate()
        print(task)
        let data = Task(value: ["task": task, "id": id])
        do {
            let realm = try! Realm()
            try realm.write({ () -> Void in
                realm.add(data)
            })
        } catch let error as NSError {
            debugPrint(error)
        }
        
        
    }
}
