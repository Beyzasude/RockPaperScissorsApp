//
//  ViewController.swift
//  RockPaperScissorsApp
//
//  Created by Beyza Sude Erol on 3.09.2023.
//

import UIKit

class GameViewController: UIViewController {
    
    
    @IBOutlet weak var userScore: UILabel!
    @IBOutlet weak var computerScore: UILabel!
    
    @IBOutlet weak var rockChoice: UIButton!
    @IBOutlet weak var paperChoice: UIButton!
    @IBOutlet weak var scissorsChoice: UIButton!
    
    @IBOutlet weak var selectedButton: UILabel!
    
    
    let activityIndicator = UIActivityIndicatorView(style: .medium)
    var userChoice: Choices?
    var result = ""
    var userScoreValue = 0
    var computerScoreValue = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedButton.text = ""
        activityIndicatorFunc()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        selectedButton.text = ""
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        updateScores()
    }
    
    func updateScores() {
        userScore.text = "\(userScoreValue)"
        computerScore.text = "\(computerScoreValue)"
    }
    
    func computerChoice() -> Choices {
        let choice: [Choices] = [.rock, .paper, .scissors]
        let randomNumber = Int.random(in: 0..<choice.count)
        return choice[randomNumber]
    }
    
    @IBAction func chooseRock(_ sender: UIButton) {
        userChoice = .rock
        selectedButton.text = userChoice?.rawValue
    }

    @IBAction func choosePaper(_ sender: UIButton) {
        userChoice = .paper
        selectedButton.text = userChoice?.rawValue
    }

    @IBAction func chooseScissors(_ sender: UIButton) {
        userChoice = .scissors
        selectedButton.text = userChoice?.rawValue
    }
    
    @IBAction func playGame(_ sender: Any) {
        if let userGameChoice = userChoice {
            let computerChoice = computerChoice()
            
            if userGameChoice == computerChoice {
                result = "Berabere 🤨"
            } else if (userGameChoice == .rock && computerChoice == .scissors) ||
                        (userGameChoice == .paper && computerChoice == .rock) ||
                        (userGameChoice == .scissors && computerChoice == .paper) {
                result = " Tebrikler Kazandınız 😊"
                userScoreValue += 1
            } else {
                result =  "Üzgünüm Kaybettiniz 😔"
                computerScoreValue += 1
            }
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
            vc.result = result
            vc.computer = computerChoice.rawValue
            vc.user = userChoice!.rawValue
           //self.navigationController?.pushViewController(vc, animated: true)
            activityIndicator.startAnimating()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 ) {
                self.navigationController?.pushViewController(vc, animated: true)
                self.activityIndicator.stopAnimating()
            }
            userChoice = nil
            
            
        }else {
            showAlert()
        }
    }
    
    @IBAction func removeAllScores(_ sender: Any) {
        userScoreValue = 0
        computerScoreValue = 0
        updateScores()
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Alert!", message: "You must make a choice before continuing.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        self.present(alert, animated: true)
        
    }
    
    func activityIndicatorFunc() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
}
