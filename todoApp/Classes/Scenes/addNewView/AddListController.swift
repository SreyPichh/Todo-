//
//  AddListController.swift
//  todoApp
//
//  Created by Macbook Pro on 2/19/19.
//  Copyright © 2019 pich. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import ReactorKit

class AddListController: UIViewController {
    var subview: AddListControllerSubview = AddListControllerSubview()
    var disposeBag: DisposeBag = DisposeBag()
    var router: AddListRoute?
    
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
//        self.reactor = AddListViewControllerReactor(router: self.router!)
        
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
        print("add btn click")
        presentor?.storeRequest(task: subview.addNew.text!, id: AddListController.id)
        
    }
    @objc func handle_backBtnClicked(){
        print("back to home")
        self.present(ViewController(), animated: true, completion: nil)
    }
}

extension AddListController: StoryboardView {
    func bind(reactor: AddListViewControllerReactor) {
        self.subview.addNew.rx.text
            .map { Reactor.Action.addNewTask($0!) }
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
        self.subview.addBtn.rx.tap
            .map{ Reactor.Action.addNewBtn }
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
    }
}
