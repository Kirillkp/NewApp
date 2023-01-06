//
//  FeedViewController.swift
//  NewsApp
//
//  Created by Кирилл Полосов on 06.01.2023.
//  
//

import UIKit

final class FeedViewController: UIViewController {
    
	private let output: FeedViewOutput

    init(output: FeedViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
	override func viewDidLoad() {
		super.viewDidLoad()
        
	}
}

extension FeedViewController: FeedViewInput {
    
}
