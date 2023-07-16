import SnapKit
import UIKit

protocol ViewControllerViewProtocol where Self: UIView {
    func setup(delegate: ViewControllerViewDelegate)
}

protocol ViewControllerViewDelegate: AnyObject {
    //TODO: View events
}

final class ViewControllerView: UIView {
    
    static func make() -> ViewControllerViewProtocol
    {
        ViewControllerView()
    }
    
    private weak var delegate: ViewControllerViewDelegate?
        
    private let contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        return stack
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let loginComponentsStackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 20
        stack.axis = .horizontal
        stack.layer.cornerRadius = 20
        return stack
    }()
    
    private let logoImageView: UIImageView = {
        let image = UIImage(named: "dreadLogos")
        let logoImage = UIImageView()
        logoImage.image = image
        logoImage.contentMode = .scaleAspectFit
        return logoImage
    }()
        
    override init(frame: CGRect = .zero)
    {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError()
    }
    
    private func setup()
    {
        backgroundColor = .white
        
        contentStackViewConstraits()
        contentViewConstraits()
        setupLoginComponentsStackView()
        setupLogoImageView()
    }
    
    private func contentStackViewConstraits()
    {
        addSubview(contentStackView)
        contentStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func contentViewConstraits()
    {
        contentStackView.addArrangedSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(contentStackView)
        }
    }
        
    private func setupLoginComponentsStackView()
    {
        contentView.addSubview(loginComponentsStackView)
        loginComponentsStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalTo(contentStackView).inset(15)
        }
    }
    
    private func setupLogoImageView()
    {
        loginComponentsStackView.addArrangedSubview(logoImageView)
        logoImageView.snp.makeConstraints { make in
            make.width.height.equalTo(300)
        }
    }
}

extension ViewControllerView: ViewControllerViewProtocol
{
    
    func setup(delegate: ViewControllerViewDelegate)
    {
        self.delegate = delegate
    }
}
