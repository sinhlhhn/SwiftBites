import Foundation
import SwiftData

final class Storage {
    static func create() -> ModelContainer {
        let schema = Schema([Category.self, Ingredient.self, Recipe.self, RecipeIngredient.self])
        let configuration = ModelConfiguration()
        let container = try! ModelContainer(for: schema, configurations: configuration)
        return container
    }
}
