//
//  QuestionsViewController.swift
//  PersonalQuiz
//
//  Created by Alexander Shevtsov on 18.04.2024.
//

import UIKit

final class QuestionsViewController: UIViewController {
// из-за static не нужно создавать экземпляр класса
// обращаемся к модели и вызываем метод
    private let questions = Question.getQuestions()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

