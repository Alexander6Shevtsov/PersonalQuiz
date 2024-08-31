//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexander Shevtsov on 19.04.2024.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var animalTypeLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    // ? - если не инициализировать, то не страшно
    var answers: [Answer]! // ! - инициализировать обязательно
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // скрываем кнопку назад
        navigationItem.hidesBackButton = true
        
        // счетчик времени выполнения кода
        let time = ContinuousClock().measure {
            updateResult()
        }
        print(time)
    }
    
    // нажатие на кнопку Done выгружает все из памяти
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    // проверка на выгрузку
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}

// MARK: - Private Methods
extension ResultViewController {
    private func updateResult() {
        var frequencyOfAnimals: [Animal: Int] = [:]
        let animals = answers.map { $0.animal } // $0 - элемент массива
        //    вместо верхней строки можно так, но это низкий КПД
        //        var animals: [Animal] = []
        //
        //        for answer in answers {
        //            animals.append(answer.animal)
        //        }
        
        // ВАРИАНТ №1
//        for animal in animals {
//            if let animalTypeCount = frequencyOfAnimals[animal] {
//                frequencyOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
//            } else {
//                frequencyOfAnimals[animal] = 1
//            }
//        }
        
        // ВАРИАНТ №"
//         for animal in animals {      // если тут nil -> то используем 0
//         frequencyOfAnimals[animal] = (frequencyOfAnimals[animal] ?? 0) + 1
//         }
        
        // простое решение
        for animal in animals { // по кей animal + 1 или используем новую пару с 0 и + 1
            frequencyOfAnimals[animal, default: 0] += 1
        }
        
        let sortedFrequentOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value }
        guard let mostFrequentAnimal = sortedFrequentOfAnimals.first?.key else { return }
        
        // Решение в одну строку но ОЧЕНЬ сложное для понимания
//        let mostFrequentAnimal = Dictionary(grouping: answers) { $0.animal }
//            .sorted { $0.value.count > $1.value.count }
//            .first?.key
        
        updateUI(with: mostFrequentAnimal)
    }
    
    // отображение результата на экране
    private func updateUI(with animal: Animal) {
        animalTypeLabel.text = "Вы - \(animal.rawValue)!"
        descriptionLabel.text = animal.definition
    }
}
