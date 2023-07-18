import SnapKit
import UIKit

protocol ViewControllerViewProtocol where Self: UIView {
    func setup(delegate: ViewControllerViewDelegate)
    func adjustViewForKeyboard(height: CGFloat,
                               animationDuration: TimeInterval)
    func resetViewFromKeyboard(animationDuration: TimeInterval)
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
        stack.axis = .vertical
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
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "email"
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1.5
        textField.layer.cornerRadius = 20
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "password"
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1.5
        textField.layer.cornerRadius = 20
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.titleLabel?.textColor = .white
        button.backgroundColor = .red
        button.layer.cornerRadius = 20
        return button
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
    }
    
    private func contentStackViewConstraits()
    {
        addSubview(contentStackView)
        contentStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentViewConstraits()
    }
    
    private func contentViewConstraits()
    {
        contentStackView.addArrangedSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(contentStackView)
        }
        
        setupLogoImageView()
        setupLoginComponentsStackView()
    }
    
    private func setupLogoImageView()
    {
        contentView.addSubview(logoImageView)
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaInsets.top).inset(20)
            make.width.height.equalTo(300)
            make.centerX.equalTo(contentView)
        }
    }
        
    private func setupLoginComponentsStackView()
    {
        contentView.addSubview(loginComponentsStackView)
        loginComponentsStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalTo(contentStackView).inset(15)
        }
        
        setupEmailTextField()
    }
        
    private func setupEmailTextField()
    {
        loginComponentsStackView.addArrangedSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        setupPasswordTextField()
    }
    
    private func setupPasswordTextField()
    {
        loginComponentsStackView.addArrangedSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        setupLoginButton()
    }
    
    private func setupLoginButton()
    {
        loginComponentsStackView.addArrangedSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(100)
        }
    }
}

extension ViewControllerView: ViewControllerViewProtocol
{
    func adjustViewForKeyboard(height: CGFloat,
                               animationDuration: TimeInterval)
    {
        UIView.animate(withDuration: animationDuration) {
                    self.frame.origin.y -= height
        }
    }
    
    func resetViewFromKeyboard(animationDuration: TimeInterval)
    {
        UIView.animate(withDuration: animationDuration) {
                    self.frame.origin.y = 0
        }
    }
    
    
    func setup(delegate: ViewControllerViewDelegate)
    {
        self.delegate = delegate
    }
}
