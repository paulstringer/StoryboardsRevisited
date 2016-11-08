import Foundation

// ORDER ENTITY MODEL

struct Order {
  
  var drink: DrinkEntity
  var cupSize: CupSizeEntity
  
  init(drink: DrinkEntity = DrinkEntityGateway.fetchAll.first!, cupSize:CupSizeEntity = CupSizeEntityGateway.fetchAll.first!) {
    self.drink = drink
    self.cupSize = cupSize
  }
}

// CUP SIZE ENTITY MODEL

typealias CupSizeIdentifier = Character

struct CupSizeEntity {
  
  let name: String
  let identifier: CupSizeIdentifier

  init(name: String, identifier: CupSizeIdentifier) {
    self.name = name
    self.identifier = identifier
  }
  
}

protocol Gateway {
  associatedtype EntityType
  associatedtype EntityIdentifierType
  
  static var fetchAll: [EntityType] { get }
  static func fetchOne(for identifier: EntityIdentifierType) -> EntityType?
  
}

struct CupSizeEntityGateway: Gateway {
  
  internal static var fetchAll: [CupSizeEntity] {
    get {
      let small = CupSizeEntity(name: "Small", identifier: "S")
      let medium = CupSizeEntity(name: "Medium", identifier: "M")
      let large = CupSizeEntity(name: "Large", identifier: "L")
      return [small, medium, large]
    }
  }
  
  internal static func fetchOne(for identifier: CupSizeIdentifier) -> CupSizeEntity? {
    return fetchAll.first { (entity) -> Bool in
      entity.identifier == identifier
    }
  }


}

// DRINK ENTITY MODEL

typealias DrinkIdentifier = Character

struct DrinkEntity {
  
  let name: String
  let identifier: Character

}

struct DrinkEntityGateway: Gateway {
  
  internal static var fetchAll: [DrinkEntity] {
    get {
      let espresso = DrinkEntity(name: "Espresso", identifier: "E")
      let drip = DrinkEntity(name: "Drip", identifier: "D")
      let latte = DrinkEntity(name: "Latte", identifier: "L")
      return [espresso, drip, latte]
    }
  }
  
  internal static func fetchOne(for identifier: DrinkIdentifier) -> DrinkEntity? {
      return fetchAll.first(where: { (entity) -> Bool in
        entity.identifier == identifier
      })
  }
  
}

