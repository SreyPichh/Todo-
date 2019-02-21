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
        
    }
    var initialState: ViewControllerReactor.State
    
    struct State {
        
    }
    var router: ViewControllerRouter
    
    
    init(router: ViewControllerRouter) {
        self.router = router
        initialState = State()
    }
    
    func mutate(action: ViewControllerReactor.Action) -> Observable<ViewControllerReactor.Mutation> {
        switch action {
        case .addNew:
            self.router.navigate()
            return Observable.empty()
        }
    }
    func reduce(state: ViewControllerReactor.State, mutation: ViewControllerReactor.Mutation) -> ViewControllerReactor.State {
        switch mutation {
            
        }
    }
    
}

