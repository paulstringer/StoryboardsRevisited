extension ViewController: StoryboardVisitableScene {
  func accept(visitor: StoryboardSceneVisitor) { visitor.prepare(self) }
}

extension OrderConfirmationViewController: StoryboardVisitableScene {
  func accept(visitor: StoryboardSceneVisitor) { visitor.prepare(self) }
}

extension StoryboardSceneVisitor {
  
  func prepare(_ scene: ViewController) { }
  
  func prepare(_ scene: OrderConfirmationViewController) {
    
    scene.navigationItem.hidesBackButton = true
  }
  
}

