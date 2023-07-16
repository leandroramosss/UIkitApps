import UIKit

protocol ViewControllerPresenterProtocol {
    func setup(delegate: ViewControllerPresenterDelegate)
    func presentContent()
}

protocol ViewControllerPresenterDelegate: AnyObject {
    func renderContent()
}

final class ViewControllerPresenter: ViewControllerPresenterProtocol {
    
    private weak var delegate: ViewControllerPresenterDelegate?
    
    func setup(delegate: ViewControllerPresenterDelegate)
    {
        self.delegate = delegate
    }
    
    func presentContent()
    {
        delegate?.renderContent()
    }
}
