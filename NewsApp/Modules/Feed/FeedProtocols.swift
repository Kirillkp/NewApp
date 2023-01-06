//
//  FeedProtocols.swift
//  NewsApp
//
//  Created by Кирилл Полосов on 06.01.2023.
//  
//

import Foundation

protocol FeedModuleInput {
	var moduleOutput: FeedModuleOutput? { get }
}

protocol FeedModuleOutput: AnyObject {
    
}

protocol FeedViewInput: AnyObject {
    
}

protocol FeedViewOutput: AnyObject {
    
}

protocol FeedInteractorInput: AnyObject {
    
}

protocol FeedInteractorOutput: AnyObject {
    
}

protocol FeedRouterInput: AnyObject {
    
}
