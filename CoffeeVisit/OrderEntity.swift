import Foundation

protocol OrderDataSource {
  
  var order: Order { get }
  
}
struct Order {
  
  var name = "Unspecified"
  
}
