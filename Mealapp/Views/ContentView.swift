import SwiftUI

struct ContentView: View {
    var categories = ["Meal", "Sides", "Dinner", "Dessert"]

    var body: some View {
        NavigationView {
            List(categories, id: \.self) { category in
                NavigationLink(destination: MealListView(category: category)) {
                    Text(category)
                }
            }
            .navigationTitle("Categories")
        }
        .background(Color.blue.edgesIgnoringSafeArea(.all))
    }
}

