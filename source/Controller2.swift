//
//  ViewController.swift
//  Tester
//
//  Created by Singgih Nn on 04/03/20.
//  Copyright © 2020 Singgih Nn. All rights reserved.
//

import UIKit

class Controller2: UIViewController {
  let label = UILabel()
  let button = UIButton(type: .custom)
  let buttonBack = UIButton(type: .custom)
  let vStack = UIStackView()
  let buttonInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)

  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    setStack()
    setLabel()
    setButton()
    setButtonBack()
  }
  
  private func setStack() {
    vStack.axis = .vertical
    vStack.alignment = .center
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
    label.text = "Controller 2"
    label.textColor = UIColor.black.withAlphaComponent(0.8)
    
    vStack.addArrangedSubview(label)
  }
  
  private func setButton() {
    button.contentEdgeInsets = buttonInsets
    button.setTitle("Set Controller 1 as Root", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .blue
    button.layer.cornerRadius = 5
    button.addTarget(self, action: #selector(navigateScreen), for: .touchUpInside)
    
    vStack.addArrangedSubview(button)
  }
  
  private func setButtonBack() {
    buttonBack.contentEdgeInsets = buttonInsets
    buttonBack.setTitle("Pop To Root", for: .normal)
    buttonBack.setTitleColor(.white, for: .normal)
    buttonBack.backgroundColor = .red
    buttonBack.layer.cornerRadius = 5
    buttonBack.addTarget(self, action: #selector(popToRoot), for: .touchUpInside)
    
    vStack.addArrangedSubview(buttonBack)
  }
  
  @objc
  private func navigateScreen() {
    guard let controllers = navigationController?.viewControllers,
      let root = controllers.first(where: { $0 is Controller1 }) else { return }

    navigationController?.setViewControllers([root], animated: true)
  }
  
  @objc
  private func popToRoot() {
    navigationController?.popToRootViewController(animated: true)
  }
}

