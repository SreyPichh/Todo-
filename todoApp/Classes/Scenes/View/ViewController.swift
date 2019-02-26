//
//  ViewController.swift
//  todoApp
//
//  Created by Macbook Pro on 2/18/19.
//  Copyright © 2019 pich. All rights reserved.
//

import UIKit
import RealmSwift
import RxCocoa
import ReactorKit
import RxSwift

class ViewController: UIViewController, View {
    typealias Reactor = ViewControllerReactor
    
    var disposeBag: DisposeBag = DisposeBag()
    
    var viewControllerDelegate: ViewControllerProtocol?
    
    var subview: ViewControllerSubview = ViewControllerSubview()
//    var addNewList: AddListController

    private var router: ViewControllerRouter?
}

extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(self.subview.header)
        self.view.addSubview(self.subview.editBtn)
        self.view.addSubview(self.subview.todoText)
        self.view.addSubview(self.subview.plusBtn)
        self.view.addSubview(self.subview.list)
        self.subview.plusBtn.addTarget(self, action: #selector(plusBtnClicked), for: .touchUpInside)
        
        self.router = ViewControllerRouter(viewController: self)
        self.reactor = ViewControllerReactor(router: self.router!, viewController: self)
    }
    override func viewDidLayoutSubviews() {
        self.subview.updateConstraints()
    }
    @objc func plusBtnClicked(){
        print("Add New list button clicked")
        self.present(AddListController(), animated: true, completion: nil)
    }
}
extension ViewController {
    func getData() -> String {
        var tasks : String?
        do {
            let realm = try! Realm()
            let result = realm.object(ofType: Task.self, forPrimaryKey: AddListController.id)
            guard let task = result?.task else {
                return ""
            }
            tasks = task
        }
        return tasks!
    }
}
extension ViewController: StoryboardView {
    func bind(reactor: ViewControllerReactor) {
        self.reactor?.state
            .map {$0.tasks}
            .bind(to: self.subview.list.rx.items(cellIdentifier: "cell")) { row, element, cell in cell.textLabel?.text = element.task }
            .disposed(by: self.disposeBag)
    }
}

