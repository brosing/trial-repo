import UIKit

class Controller1: UIViewController {
  let label = UILabel()
  let button = UIButton(type: .custom)
  let vStack = UIStackView()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    setStack()
    setLabel()
    setButton()
  }
  
  private func setStack() {
    vStack.axis = .vertical
    vStack.spacing = 10
    
    // Set constraints
    view.addSubview(vStack)
    vStack.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      vStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      vStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
    ])
  }
  
  private func setLabel() {
    label.text = "Controller 1"
    label.textColor = UIColor.black.withAlphaComponent(0.8)
    
    vStack.addArrangedSubview(label)
  }
  
  private func setButton() {
    let insets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    button.contentEdgeInsets = insets
    button.setTitle("Next", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .blue
    button.layer.cornerRadius = 5
    button.addTarget(self, action: #selector(navigateScreen), for: .touchUpInside)
    
    vStack.addArrangedSubview(button)
  }
  
  @objc
  private func navigateScreen() {
    navigationController?.pushViewController(Controller2(), animated: true)
  }
}

