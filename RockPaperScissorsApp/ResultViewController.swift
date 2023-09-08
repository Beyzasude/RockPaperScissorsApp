//
//  ResultViewController.swift
//  RockPaperScissorsApp
//
//  Created by Beyza Sude Erol on 5.09.2023.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var gameResult: UILabel!
    @IBOutlet weak var computerChoice: UILabel!
    @IBOutlet weak var userChoice: UILabel!
    
    let activityIndicator = UIActivityIndicatorView(style: .medium)
    var result = ""
    var computer = ""
    var user = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        gameResult.text = result
        computerChoice.text = computer
        userChoice.text = user
        
        activityIndicatorFunc()

    }
    
    @IBAction func playAgain(_ sender: Any) {
        activityIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 ) {
            self.navigationController?.popToRootViewController(animated: true)
            self.activityIndicator.stopAnimating()
        }
    }
    
    func activityIndicatorFunc() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
