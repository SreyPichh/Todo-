//
//  AddListViewControllerReactor.swift
//  todoApp
//
//  Created by Pich on 2/20/19.
//  Copyright © 2019 pich. All rights reserved.
//

import ReactorKit
import RxSwift
import RxCocoa

class AddListViewControllerReactor: Reactor {
    enum Action {
        case addNewTask(String)
        case addNew
    }
    
    enum Mutation {
        case addedTask
    }
    var initialState: AddListViewControllerReactor.State
    struct State {
        var task: String
    }
    init() {
        initialState = State(task: "")
    }
    
    // mutation business logic
    func mutate(action: AddListViewControllerReactor.Action) -> Observable<AddListViewControllerReactor.Mutation> {
        switch action {
        case .addNewTask(let task):
            let msg: String = ""
            if
        }
        return Observable.empty()
    }
    func reduce(state: AddListViewControllerReactor.State, mutation: AddListViewControllerReactor.Mutation) -> AddListViewControllerReactor.State {
        return state
    }
}
