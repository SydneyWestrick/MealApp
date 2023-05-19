import SwiftUI

class MealController: ObservableObject {
    @Published var categories = ["Meal", "Sides", "Dinner", "Dessert"]
    @Published var meals: [Meal] = []
    @Published var mealDetails: MealDetailsResponse?

    func fetchMeals(for category: String) async {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(category)") else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let response = try decoder.decode(MealResponse.self, from: data)
            meals = response.meals?.compactMap { mealData in
                return Meal(id: UUID(), idMeal: mealData.idMeal, strMeal: mealData.strMeal)
            } ?? []
        } catch {
            print("Error: \(error)")
        }
    }

    func fetchMealDetails(for meal: Meal) async {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(meal.idMeal)") else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let response = try decoder.decode(MealDetailsResponse.self, from: data)
            mealDetails = response
        } catch {
            print("Error: \(error)")
        }
    }
}

