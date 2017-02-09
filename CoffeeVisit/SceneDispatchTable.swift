//MARK: TODO: Investigate possibility to generate boiler plate from Storyboard file


//Extends Visitor Protocol with Matching Operations for Handling Each VisitableScene

extension StoryboardController {
  
  func visit(_ scene: RootViewController) {
    // Prepare ViewController
  }
  
  func visit(_ scene: ChooseBeverageViewController) {
    // Prepare ChooseBeverageViewController
    scene.interactor = ChooseBeverageInteractor(view: scene)
    scene.delegate = context
  }
  
  func visit(_ scene: OrderSummaryViewController) {
    // Prepare OrderSummaryViewController
    scene.interactor = OrderSummaryInteractor(view: scene, context: context)
  }
  
  func visit(_ scene: CustomiseOrderViewController) {
    // Prepare CustomiseOrderViewController
    scene.interactor = CustomiseOrderSummaryInteractor(view: scene, context: context)
  }
  
  func visit(_ scene: OrderConfirmationViewController) {
    // Prepare OrderConfirmationViewController
    scene.navigationItem.hidesBackButton = true
  }
  
  func visit(_ scene: ChooseSizeViewController) {
    // Prepare ChooseSizeViewController
    scene.interactor = ChooseSizeInteractor(view: scene)
    scene.delegate = context
  }
  
}


//MARK: View Controller Visitor Opt-in

//Adds Conformance to Destination View Controllers That Require Preparation.

extension RootViewController: StoryboardVisitableScene {
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
