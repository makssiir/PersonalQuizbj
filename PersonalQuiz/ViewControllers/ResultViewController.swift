//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Vasichko Anna on 15.05.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    var answers: [Answer]!
    
    @IBOutlet weak var animalTypedLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true // скрыть кнопку возврата
        
        updateResult()
    }
        deinit {
            print("ResultViewController is deallocated")
    }
}

extension ResultViewController {
    
    private func updateResult() { // метод расчета результата
        
        var frequencyOfAnimals:[AnimalType: Int] = [:]
        
        let animals = answers.map { $0.animal }
        for animal in animals {
            frequencyOfAnimals[animal] = (frequencyOfAnimals[animal] ?? 0) + 1
        }
        
        let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value }
        guard let mostFrequncyAnimal = sortedFrequencyOfAnimals.first?.key else { return }
        
        updateUI(with: mostFrequncyAnimal)
    }
    private func updateUI(with animal: AnimalType) {
        animalTypedLabel.text = "Вы - \(animal.rawValue) !"
        descriptionLabel.text = animal.definition
    }
    
    
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
}
    


