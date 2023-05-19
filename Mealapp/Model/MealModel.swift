import Foundation

struct Meal: Codable, Identifiable {
    var id: UUID
    let idMeal: String
    let strMeal: String
}

struct MealDetailsResponse: Codable {
    let meals: [MealDetails]?
}

struct MealDetails: Codable {
    let ingredients: [String]
    let instructions: String
}

struct MealResponse: Codable {
    let meals: [MealData]?
}

struct MealData: Codable {
    let idMeal: String
    let strMeal: String
}

