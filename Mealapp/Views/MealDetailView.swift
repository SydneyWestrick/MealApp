import SwiftUI

struct MealDetailView: View {
    var meal: Meal
    @StateObject private var mealController = MealController()

    var body: some View {
        VStack {
            if let mealDetails = mealController.mealDetails {
                Text("Ingredients: \(mealDetails.meals?.first?.ingredients.joined(separator: ", ") ?? "")")
                Text("Instructions: \(mealDetails.meals?.first?.instructions ?? "")")
            } else {
                Text("No Recipe Available")
            }
        }
        .task {
            await mealController.fetchMealDetails(for: meal)
        }
        .navigationTitle(meal.strMeal)
    }
}

