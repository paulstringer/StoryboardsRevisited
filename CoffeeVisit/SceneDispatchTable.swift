// Adds Conformance to Destination View Controllers That Require Preparation.

extension ViewController: StoryboardVisitableScene {
  func accept(visitor: StoryboardSceneVisitor) { visitor.visit(self) }
}

extension OrderConfirmationViewController: StoryboardVisitableScene {
  func accept(visitor: StoryboardSceneVisitor) { visitor.visit(self) }
}

extension OrderSummaryViewController: StoryboardVisitableScene {
  func accept(visitor: StoryboardSceneVisitor) { visitor.visit(self) }
}

// Extends The Visitor Protocol with Operations for Handling Destinations

extension StoryboardSceneVisitor {
  
  func visit(_ scene: ViewController) {
    
    // Prepare ViewController
  
  }
  
  func visit(_ scene: OrderSummaryViewController) {
    
    // Prepare OrderSummaryViewController
    
    if let source = self.segue.source as? OrderDataSource {
      scene.model = OrderSummaryViewModel(name: source.order.name)
    } else {
      scene.model = OrderSummaryViewModel(name: "Unknown")
    }
    
  }
  
  func visit(_ scene: OrderConfirmationViewController) {
    
    // Prepare OrderConfirmationViewController
    
    scene.navigationItem.hidesBackButton = true
  }
  
}

