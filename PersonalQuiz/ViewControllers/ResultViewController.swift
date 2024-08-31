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
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
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
        let animals = answers.map { $0.animal }
        
        /*
         for animal in animals {
         if let animalTypeCount = frequencyOfAnimals[animal] {
         frequencyOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
         } else {
         frequencyOfAnimals[animal] = 1
         }
         }
         */
        
        /*
         for animal in animals {
         frequencyOfAnimals[animal] = (frequencyOfAnimals[animal] ?? 0) + 1
         }
         */
        
        for animal in animals {
            frequencyOfAnimals[animal, default: 0] += 1
        }
        
        let sortedFrequentOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value }
        guard let mostFrequentAnimal = sortedFrequentOfAnimals.first?.key else { return }
      
        // Решение в одну строку:
        /*
        let mostFrequentAnimal = Dictionary(grouping: answers) { $0.animal }
            .sorted { $0.value.count > $1.value.count }
            .first?.key
        */
        
        updateUI(with: mostFrequentAnimal)
    }
    
    private func updateUI(with animal: Animal) {
        animalTypeLabel.text = "Вы - \(animal.rawValue)!"
        descriptionLabel.text = animal.definition
    }
}
