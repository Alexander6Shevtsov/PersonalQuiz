//
//  Question.swift
//  PersonalQuiz
//
//  Created by Alexander Shevtsov on 23.04.2024.
//

    // если типы данных важны то struct
struct Question { // если пользователь не может ничего менять, то все let
    let title: String
    let responseType: ResponseType // этот тип мы создали сами
    let answers: [Answer] // сами создали тип
    
    // MVP - данные, пока нет других
   static func getQuestions() -> [Question] { //static делает метод не наследуемым
        [
            Question(
                title: "Какую пищу вы предпочитаете?",
                responseType: .single,
                answers: [ // в main создаем массив оутлетов
                    Answer(title: "Стейк", animal: .dog),
                    Answer(title: "Рыба", animal: .cat),
                    Answer(title: "Морковь", animal: .rabbit),
                    Answer(title: "Кукуруза", animal: .turtle)
                ]
            ),
            Question(
                title: "Что вам нравится больше?",
                responseType: .multiple,
                answers: [
                    Answer(title: "Плавать", animal: .dog),
                    Answer(title: "Спать", animal: .cat),
                    Answer(title: "Обьниматься", animal: .rabbit),
                    Answer(title: "Есть", animal: .turtle)
                ]
            ),
            Question(
                title: "На машине катаетесь?",
                responseType: .ranged,
                answers: [
                    Answer(title: "Ненавижу", animal: .cat),
                    Answer(title: "Нервничаю", animal: .rabbit),
                    Answer(title: "Не замечаю", animal: .turtle),
                    Answer(title: "Обожаю", animal: .dog)
                ]
            )
        ]
    }
}

// создаем свой тип данных
enum ResponseType { // если типы данных не важны то enum
    case single
    case multiple
    case ranged
}

struct Answer {
    let title: String
    let animal: Animal
}

enum Animal: Character {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var definition: String { // перебираем перечисление
        switch self { // self - сами себя
        case .dog:
            return "Вам нравится быть с друзьями."
        case .cat:
            return "Вы себе на уме"
        case .rabbit:
            return "Вам нравиться все мягкое"
        case .turtle:
            return "Ваша сила - мудрость"
        }
    }
}
// пример как это работает
//let animal: Animal = .dog
//animal.definition
