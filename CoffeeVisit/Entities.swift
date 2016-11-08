import Foundation

// ORDER ENTITY MODEL

struct Order {
  
  var drink: DrinkEntity
  var cupSize: CupSizeEntity
  
  init(drink: DrinkEntity = DrinkEntityGateway.fetchAllDrinks.first!, cupSize:CupSizeEntity = CupSizeEntityGateway.fetchAllCupSizes.first!) {
    self.drink = drink
    self.cupSize = cupSize
  }
}

// CUP SIZE ENTITY MODEL

typealias CupSizeIdentifier = Character

struct CupSizeEntity {
  
  let name: String
  let identifier: CupSizeIdentifier
  
  init(identifier: CupSizeIdentifier) {
    
    let found_ = CupSizeEntityGateway.fetchAllCupSizes.filter { (e) -> Bool in
      return e.identifier == identifier
    }.first
    
    guard let found = found_ else { fatalError() }
    
    self.name = found.name
    self.identifier = found.identifier
    
  }
  
  init(name: String, identifier: CupSizeIdentifier) {
    self.name = name
    self.identifier = identifier
  }
  
  
  
}

struct CupSizeEntityGateway {
  
  static var fetchAllCupSizes: [CupSizeEntity] {
    get {
      let small = CupSizeEntity(name: "Small", identifier: "S")
      let medium = CupSizeEntity(name: "Medium", identifier: "M")
      let large = CupSizeEntity(name: "Large", identifier: "L")
      return [small, medium, large]
    }
  }
  
}

// DRINK ENTITY MODEL

typealias DrinkIdentifier = Character

enum Drink: DrinkIdentifier {
  case Espresso = "E"
  case Drip = "D"
  case Latte = "L"
}


struct DrinkEntity {
  
  let name: String
  let identifier: Character

}

struct DrinkEntityGateway {
  
  static var fetchAllDrinks: [DrinkEntity] {
    get {
      let espresso = DrinkEntity(name: "Espresso", identifier: Drink.Espresso.rawValue)
      let drip = DrinkEntity(name: "Drip", identifier: Drink.Espresso.rawValue)
      let latte = DrinkEntity(name: "Latte", identifier: Drink.Latte.rawValue)
      return [espresso, drip, latte]
    }
  }
  
}

