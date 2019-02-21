//
//  AddListController.swift
//  todoApp
//
//  Created by Macbook Pro on 2/19/19.
//  Copyright © 2019 pich. All rights reserved.
//

import UIKit

class AddListController: UIViewController {
    var subview: AddListControllerSubview = AddListControllerSubview()
    static var id: Int = Int(arc4random())
    
    var presentor: Presentor?
}

extension AddListController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let router = AddListRoute(addListController: self)
        self.presentor = Presentor(router: router)
        
        self.view.backgroundColor = UIColor.white 
        self.view.addSubview(self.subview.header)
        self.view.addSubview(self.subview.backBtn)
        self.view.addSubview(self.subview.todoText)
        self.view.addSubview(self.subview.addNew)
        self.view.addSubview(self.subview.addBtn)
        
        self.subview.addBtn.addTarget(self, action: #selector(handle_addBtnClicked), for: .touchUpInside)
        self.subview.backBtn.addTarget(self, action: #selector(handle_backBtnClicked), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        self.subview.addListUpdateConstraints()
    }
}

extension AddListController {
    @objc func handle_addBtnClicked(){
        AddListController.id = AddListController.id + 1
        print("add btn clickkkkkkkk")
        presentor?.storeRequest(task: subview.addNew.text!, id: AddListController.id)
        
    }
    @objc func handle_backBtnClicked(){
        print("back to home")
        self.present(ViewController(), animated: true, completion: nil)
    }
}
