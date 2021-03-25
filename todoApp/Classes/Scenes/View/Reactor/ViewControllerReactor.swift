//
//  ViewControllerReactor.swift
//  todoApp
//
//  Created by Macbook Pro on 2/19/19.
//  Copyright © 2019 pich. All rights reserved.
//

import ReactorKit
import RxSwift
import RxCocoa

class ViewControllerReactor: Reactor {
    enum Action {
        case addNew
    }
    
    enum Mutation {
        case setData([TaskModel])
    }
    struct State {
        var tasks: [TaskModel]
    }
    private var router: ViewControllerRouter
    private var viewController: ViewController
    
    var initialState: ViewControllerReactor.State = State(tasks: [TaskModel(task: "Hello")])
    
    init(router: ViewControllerRouter, viewController: ViewController) {
        self.router = router
        self.viewController = viewController
    }
    
    func mutate(action: ViewControllerReactor.Action) -> Observable<ViewControllerReactor.Mutation> {
        switch action {
        case .addNew:
            self.router.navigate()
            return Observable.empty()
        }
    }
    func reduce(state: ViewControllerReactor.State, mutation: ViewControllerReactor.Mutation) -> ViewControllerReactor.State {
        var newState = state
        switch mutation {
            case .setData(let tasks):
                newState.tasks = tasks
        }
        return newState
    }
    
}

