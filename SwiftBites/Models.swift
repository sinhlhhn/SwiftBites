import Foundation
import SwiftData

@Model
final class Ingredient {
    let id: UUID
    var name: String = ""

    init(id: UUID = UUID(), name: String = "") {
      self.id = id
      self.name = name
    }
}

@Model
final class Category {
    let id: UUID
    var name: String
    var recipes: [Recipe]

    init(id: UUID = UUID(), name: String = "", recipes: [Recipe] = []) {
      self.id = id
      self.name = name
      self.recipes = recipes
    }
}

@Model
final class Recipe {
    let id: UUID
    var name: String
    var summary: String
    var category: Category?
    var serving: Int
    var time: Int
    @Relationship(deleteRule: .cascade)
    var ingredients: [RecipeIngredient]
    var instructions: String
    var imageData: Data?

    init(
      id: UUID = UUID(),
      name: String = "",
      summary: String = "",
      category: Category? = nil,
      serving: Int = 1,
      time: Int = 5,
      ingredients: [RecipeIngredient] = [],
      instructions: String = "",
      imageData: Data? = nil
    ) {
      self.id = id
      self.name = name
      self.summary = summary
      self.category = category
      self.serving = serving
      self.time = time
      self.ingredients = ingredients
      self.instructions = instructions
      self.imageData = imageData
    }
}

@Model
final class RecipeIngredient {
    let id: UUID
    var ingredient: Ingredient
    var quantity: String

    init(id: UUID = UUID(), ingredient: Ingredient = Ingredient(), quantity: String = "") {
      self.id = id
      self.ingredient = ingredient
      self.quantity = quantity
    }
}
