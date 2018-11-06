//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    var numberOfQuestions = Int()
   var numberCorrect = 0
    var allQuestions = QuestionBank()
    var pickedAnswer: Bool = false
    var questionNumber = 0
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberOfQuestions = allQuestions.list.count
        let firstQuestion = allQuestions.list[0]
    questionLabel.text = firstQuestion.questionText
   progressLabel.text = "\(questionNumber+1)/\(numberOfQuestions)"
    scoreLabel.text = "\(numberCorrect)/\(numberOfQuestions)"
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
      
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        nextQuestion()
      
       
    }
    
    
    
    func updateUI() {
    
        scoreLabel.text = "\(numberCorrect)/\(numberOfQuestions)"
        progressLabel.text = "\(questionNumber+1)/\(numberOfQuestions)"
         questionLabel.text = allQuestions.list[questionNumber].questionText
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber)
    }
    

    func nextQuestion() {
       numberOfQuestions = allQuestions.list.count
        if questionNumber != numberOfQuestions - 1{
           print("\(questionNumber)/\(numberOfQuestions)")
            questionNumber = questionNumber + 1
        updateUI()
        } else if questionNumber == numberOfQuestions - 1 {
         updateUI()
            let alert = UIAlertController(title: "Awesome", message: "You've finished all of the questions, do you want to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
               self.startOver()
            }
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }
    
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        if correctAnswer == pickedAnswer {
            numberCorrect = numberCorrect+1
            updateUI()
        } else {
            
        }
    }
    
    
    func startOver() {
      print("startingover")
        questionNumber = 0
        numberCorrect = 0
        updateUI()
    }
    

    
}
