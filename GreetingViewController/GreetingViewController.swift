//
//  ViewController.swift
//  GreetingViewController
//
//  Created by Карина on 27.02.2023.
//

import UIKit

protocol GreetingViewProtocol: AnyObject { //название протокола - название контроллера сцена, далее слой это вью, далее протокол
    
    func setGreeting(_ greeing: String) // данные для отображения на экране, скромная роль
    
}

class GreetingViewController: UIViewController {

    
    @IBOutlet var greetingLabel: UILabel!
    
    private var presenter: GreetingPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let person = Person(name: "Tim", surname: "Cook")
      presenter = GreetingPresenter(view: self, person: person)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        presenter.showGreeting()
    }

}

extension GreetingViewController: GreetingViewProtocol {
    func setGreeting(_ greeing: String) {
        greetingLabel.text = greeing
    }
}

