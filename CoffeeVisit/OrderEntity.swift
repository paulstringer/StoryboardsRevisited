import Foundation

enum CupSize: String {
  case Small = "Small"
  case Medium = "Medium"
  case Large = "Large"
}

enum Drink: String {
  case Espresso = "Espresso"
  case Drip = "Drip"
  case Latte = "Latte"
}

struct Order {
  
  var drink: Drink
  var cupSize: CupSize
  
  init(drink: Drink = .Drip, cupSize:CupSize = .Medium) {
    self.drink = drink
    self.cupSize = cupSize
  }
}
