//
//  LiveSupportContract.swift
//  LiveSupportApp
//
//  Created by Şehriban Yıldırım on 17.10.2024.
//  
//

// MARK: View Output (Presenter -> View)
protocol PresenterToViewLiveSupportProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterLiveSupportProtocol {
    func loadData()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorLiveSupportProtocol {
    
    var presenter: InteractorToPresenterLiveSupportProtocol? { get set }
    func fetchLiveSupportData()
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterLiveSupportProtocol {
    func didFetchLiveSupportData(_ responses: [LiveSupportResponse])
    func didFailToFetchLiveSupportData(with error: Error)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterLiveSupportProtocol {
    
}
