import Foundation
import UIKit

protocol ViewControllerPresenterProtocol {
    func setup(delegate: ViewControllerPresenterDelegate)
    func presentContent()
    func handleKeyboardWillShow(intersectionHeight: CGFloat,
                                animationDuration: TimeInterval)
    func handleKeyboardWillHide(animationDuration: TimeInterval)
}

protocol ViewControllerPresenterDelegate: AnyObject {
    func renderContent()
}

final class ViewControllerPresenter: ViewControllerPresenterProtocol {
    
    private weak var delegate: ViewControllerPresenterDelegate?
    private weak var view: ViewControllerViewProtocol?
    
    func setup(delegate: ViewControllerPresenterDelegate)
    {
        self.delegate = delegate
    }
    
    func presentContent()
    {
        delegate?.renderContent()
    }
    
    func handleKeyboardWillShow(intersectionHeight: CGFloat,
                                animationDuration: TimeInterval)
    {
        view?.adjustViewForKeyboard(height: intersectionHeight,
                                    animationDuration: animationDuration)
    }
    
    func handleKeyboardWillHide(animationDuration: TimeInterval)
    {
        view?.resetViewFromKeyboard(animationDuration: animationDuration)
    }
}
