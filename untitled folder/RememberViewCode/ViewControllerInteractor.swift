import UIKit

protocol ViewControllerInteractorProtocol {
    func viewDidLoad()
}

final class ViewControllerInteractor: ViewControllerInteractorProtocol {
    
    private let coordinator: ViewControllerCoordinatorProtocol
    private let dataStore: ViewControllerDataStoreProtocol
    private let presenter: ViewControllerPresenterProtocol
    
    init(coordinator: ViewControllerCoordinatorProtocol,
         dataStore: ViewControllerDataStoreProtocol,
         presenter: ViewControllerPresenterProtocol)
    {
        self.coordinator = coordinator
        self.dataStore = dataStore
        self.presenter = presenter
    }
    
    func viewDidLoad()
    {
        presenter.presentContent()
    }
}
