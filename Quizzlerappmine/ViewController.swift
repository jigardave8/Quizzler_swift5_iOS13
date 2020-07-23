//
//  ViewController.swift
//  Quizzlerappmine
//
//  Created by jigar on 20/05/19.
//  Copyright © 2019 jigar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions  = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var progressLabel: UILabel!
    
    @IBOutlet weak var progressBar: UILabel!
    
    
    override func viewDidLoad()
    
    {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "abstract1.jpg")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        // Do any additional setup after loading the view.
    
        let firstQuestion = allQuestions.list[0]
        
        questionLabel.text = firstQuestion.questionText
        
    }
    //
    
    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if sender.tag == 1{
            pickedAnswer = true
        }
        else if sender.tag == 2{
            pickedAnswer = false
        }
        
        checkAnswer()
        questionNumber = questionNumber + 1
        nextQuestion()
        
    }
    
    func updateUI() {
        
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1)/13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber)
    }
    
    
    func nextQuestion()
    {
        if questionNumber <= 12
        {
        questionLabel.text = allQuestions.list[questionNumber].questionText
         
        updateUI()
        }
        else {
            let alert = UIAlertController(title: "Awesome", message: "You've finished all the question, do you want to start over ?", preferredStyle: .alert)
            
            let restartAction  = UIAlertAction(title: "Restart", style: .default, handler: {(UIAlertAction) in self.startOver()})
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[0].answer
        if correctAnswer == pickedAnswer {
//            print("You got it !")
            ProgressHUD.showSuccess("Correct")
            score = score + 1
            //   or         score += 1

            
            
        }
        else{
//            print("Wrong!")
            ProgressHUD.showError("Wrong")
        }
        
        
    }
    
    
    func startOver() {
        
    questionNumber = 0
        nextQuestion()
    }
    
    

}

