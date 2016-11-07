// Adds Conformance to Destination View Controllers That Require Preparation.

extension ViewController: StoryboardVisitableScene {
  func accept(visitor: StoryboardController) { visitor.visit(self) }
}

extension ChooseBeverageViewController: StoryboardVisitableScene {
  func accept(visitor: StoryboardController) { visitor.visit(self) }
}

extension OrderConfirmationViewController: StoryboardVisitableScene {
  func accept(visitor: StoryboardController) { visitor.visit(self) }
}

extension OrderSummaryViewController: StoryboardVisitableScene {
  func accept(visitor: StoryboardController) { visitor.visit(self) }
}

extension ChooseSizeViewController: StoryboardVisitableScene {
  func accept(visitor: StoryboardController) { visitor.visit(self) }
}

extension CustomiseOrderViewController: StoryboardVisitableScene {
  func accept(visitor: StoryboardController) { visitor.visit(self) }
}

// Extends The Visitor Protocol with Operations for Handling Destinations

extension StoryboardController {
  
  func visit(_ scene: ViewController) {
    
    // Prepare ViewController
  
  }
  
  func visit(_ scene: ChooseBeverageViewController) {
    
    // Prepare ChooseBeverageViewController
    
    scene.delegate = context
  }
  
  func visit(_ scene: OrderSummaryViewController) {
    
    // Prepare OrderSummaryViewController

    scene.presenter = OrderSummaryPresenter(view: scene, context: context)
    
  }
  
  func visit(_ scene: CustomiseOrderViewController) {
    
    // Prepare CustomiseOrderViewController
    
    scene.presenter = CustomiseOrderSummaryPresenter(view: scene, context: context)
    
    
  }
  func visit(_ scene: OrderConfirmationViewController) {
    
    // Prepare OrderConfirmationViewController
    
    scene.navigationItem.hidesBackButton = true
  }
  
  func visit(_ scene: ChooseSizeViewController) {
    
    // Prepare ChooseSizeViewController
    
    scene.delegate = context
    
  }
  
}

