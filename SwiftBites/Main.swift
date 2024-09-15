import SwiftUI

/// The main view that appears when the app is launched.
struct ContentView: View {
  @Environment(\.modelContext) var context

  var body: some View {
    TabView {
      RecipesView()
        .tabItem {
          Label("Recipes", systemImage: "frying.pan")
        }

      CategoriesView()
        .tabItem {
          Label("Categories", systemImage: "tag")
        }

      IngredientsView()
        .tabItem {
          Label("Ingredients", systemImage: "carrot")
        }
    }
  }
}
