//
//  AddListRoute.swift
//  todoApp
//
//  Created by Pich on 2/20/19.
//  Copyright © 2019 pich. All rights reserved.
//

import Foundation

final class AddListRoute{
    weak var addListController: AddListController?
    init(addListController: AddListController) {
        self.addListController = addListController
    }
    func addBtn_navigate() -> Void {
        self.addListController?.present(ViewController(), animated: true, completion: nil)
    }
}
