//
//  FeedPresenter.swift
//  NewsApp
//
//  Created by Кирилл Полосов on 06.01.2023.
//  
//

import Foundation

final class FeedPresenter {
    
	weak var view: FeedViewInput?
    weak var moduleOutput: FeedModuleOutput?
    
	private let router: FeedRouterInput
	private let interactor: FeedInteractorInput
    
    init(router: FeedRouterInput,
         interactor: FeedInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension FeedPresenter: FeedModuleInput {
    
}

extension FeedPresenter: FeedViewOutput {
    
}

extension FeedPresenter: FeedInteractorOutput {
    
}
