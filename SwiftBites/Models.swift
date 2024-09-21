import Foundation
import SwiftData

@Model
final class Ingredient: Identifiable, Hashable {
    let id: UUID = UUID()
    var name: String = ""
    @Relationship(deleteRule: .cascade, inverse: \RecipeIngredient.ingredient)
    var recipeIngredient: RecipeIngredient?

    init(name: String = "") {
      self.name = name
    }
}

@Model
final class Category: Identifiable, Hashable {
    let id: UUID = UUID()
    var name: String
    @Relationship(inverse: \Recipe.category)
    var recipes: [Recipe] = []

    init(name: String) {
      self.name = name
    }
}

@Model
final class Recipe: Identifiable, Hashable {
    let id: UUID = UUID()
    var name: String
    var summary: String
    var category: Category?
    var serving: Int
    var time: Int
    @Relationship(deleteRule: .cascade, inverse: \RecipeIngredient.recipe)
    var ingredients: [RecipeIngredient] = []
    var instructions: String
    var imageData: Data?

    init(
      name: String = "",
      summary: String = "",
      category: Category? = nil,
      serving: Int = 1,
      time: Int = 5,
      instructions: String = "",
      imageData: Data? = nil
    ) {
      self.name = name
      self.summary = summary
      self.category = category
      self.serving = serving
      self.time = time
      self.instructions = instructions
      self.imageData = imageData
    }
}

@Model
final class RecipeIngredient: Identifiable, Hashable {
    let id: UUID = UUID()
    var ingredient: Ingredient?
    var recipe: Recipe?
    var quantity: String

    init(quantity: String) {
      self.quantity = quantity
    }
}
