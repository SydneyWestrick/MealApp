import SwiftUI

struct MealListView: View {
    var category: String
    @StateObject private var mealController = MealController()

    var body: some View {
        ScrollView {
            LazyVStack {
                if mealController.meals.isEmpty {
                    Text("No meals available")
                        .font(.title)
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                } else {
                    ForEach(mealController.meals.sorted(by: { $0.strMeal < $1.strMeal })) { meal in
                        NavigationLink(destination: MealDetailView(meal: meal)) {
                            Text(meal.strMeal)
                                .foregroundColor(.white)
                                .font(.title)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .cornerRadius(10)
                                .padding(.horizontal)
                                .padding(.vertical, 4)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
        .task {
            await mealController.fetchMeals(for: category)
        }
        .navigationTitle(category)
    }
}

