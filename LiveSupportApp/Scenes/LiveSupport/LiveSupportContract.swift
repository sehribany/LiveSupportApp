//
//  LiveSupportContract.swift
//  LiveSupportApp
//
//  Created by Şehriban Yıldırım on 17.10.2024.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewLiveSupportProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterLiveSupportProtocol {
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorLiveSupportProtocol {
    
    var presenter: InteractorToPresenterLiveSupportProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterLiveSupportProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterLiveSupportProtocol {
    
}
