//
//  ViewControllerRouter.swift
//  todoApp
//
//  Created by Macbook Pro on 2/19/19.
//  Copyright © 2019 pich. All rights reserved.
//

import Foundation

final class ViewControllerRouter {
    weak var viewController: ViewController?
    init(viewController: ViewController) {
        self.viewController = viewController
    }
    func navigate() -> Void {
        self.viewController?.present(AddListController(), animated: true, completion: nil)
    }
}
