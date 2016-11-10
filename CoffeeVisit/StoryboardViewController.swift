import UIKit

//TODO: Refactor to remove repetition

//UIViewController

class StoryboardViewController: UIViewController, StoryboardManagedScene {
  
  public var storyboardSegueHandler: StoryboardSegueHandler!
  
  override open func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    storyboardSegueHandler.prepare(for: segue, sender: sender)
    
  }
  
}

//UITableViewController

class StoryboardTableViewController: UITableViewController, StoryboardManagedScene {
  
  public var storyboardSegueHandler: StoryboardSegueHandler!
  
  override open func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    storyboardSegueHandler.prepare(for: segue, sender: sender)
    
  }
  
}

//UINavigationController

class StoryboardNavigationController: UINavigationController, StoryboardManagedScene {
  
  public var storyboardSegueHandler: StoryboardSegueHandler! {
    
    didSet {
      
      prepareRootViewController()
      
    }
    
  }
  
  private func prepareRootViewController() {
    
    guard let root = self.topViewController else { return }
    
    let segue = UIStoryboardSegue(identifier: nil, source: self, destination: root)
    
    prepare(for: segue, sender: nil)
    
  }
  
  override open func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    storyboardSegueHandler.prepare(for: segue, sender: sender)
    
  }
  
}


