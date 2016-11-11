# Storyboards Revisited
**Swift Summit Talk, San Francisco, 2016.**

--

This project is a 'proof of concept' example taken from the talk *Storyboards Revisited*. The project embraces the art of '[metaprogramming](https://en.wikipedia.org/wiki/Metaprogramming)' using storyboards. The goal is to do so in a way that adheres to SOLID principles & is compatible with [clean architecture](https://8thlight.com/blog/uncle-bob/2012/08/13/the-clean-architecture.html) patterns.

#### What's the Story?

The goal of this project is to demonstrate that Storyboards can be used in even complex apps to describe flow without trading flexibility. To do this we require an approach that helps us to:

- Enable the ability to change flow with minimal impact on code
- Move segue related responsibilities outside of View Controllers
- Gather together related Storyboard responsibilities

The exact opposite of these is typically the case where storyboards & code become intrinsically entwined with one another resulting in hard to maintain apps. This can lead to developers reasonably questioning if Storyboards are a suitable choice for a well architected, complex app.

> Changes in our Storyboard shouldn't require changes in our code

The challenge is to find an 'orthogonal' design where **changes in our Storyboard  don't Require changes in code**. 🤔

-
### Revisiting Design Patterns

> “Visitor pattern lets you add operations to classes without changing them. Visitor achieves this by using a technique called double-dispatch
> ...
> The operation that gets executed depends on both the type of Visitor and the type of Element it visits.” - Design Patterns, GoF

To achieve this the example uses the [Visitor Pattern](https://en.wikipedia.org/wiki/Visitor_pattern) and the Dual Dispatch mechanism to do away with an entire category of code smells typically associated with Storyboards such as:

- 🙈 stringly-typed code
- 🤕 switch statements 
- 💥 forced! casts

Through use of the Visitor Pattern we are able to add segue related behaviour to View Controllers without changing them. The Visitor Pattern brings a further benefit in that it allows us to group related view controller configuration code.

This example is provided so as to share what seems to be a promising technique for solving some of the problems described. 

-

### Try It - *Refactoring Storyboards*

The first test of the solution is to see if we can change storyboards without impacting code e.g is our Storyboard 'Orthogonal' to our code.

Try these Storyboard refactorings. After each refactoring run again and note that the application continues to function **without any** code changes:

**Part 1** - Refactor **Choose Size** scene to appear before **Order summary** scene [[Animated](Demo-Part1.gif)]

1. Open Main.storyboard
- Delete Segue between scenes *Customise Drink* -> *Choose Size*
- Control-Drag a push segue from scene *Choose Drink's* Cell -> *Choose Size*
- Control-Drag a push segue from scene *Choose Size* Cell -> *Order Summary*

**Part 2** - Refactor **Choose Size** scene to precede **Choose Drink** scene [[Animated](Demo-Part2.gif)]

1. Control-Drag from Navigation Controller and connect outlet ```rootViewController``` to *Choose Size* scene
- Control-Drag a push segue from *Choose Size* Cell -> *Drink Size* scene
- Control-Drag a push segue from *Choose Drink* Cell -> *Order Summary* scene

### To Do

- Explore the limitations of this approach
- Implement the 'Add Ins' scene
- Generalise the solution to a library portable to other projects
- Code generate the small amount of boiler plate code that's required to implement the visitor pattern for each view controller.

#### Please contribute via PR's + Issues! - This is an ongoing work in progress. 

- [@paulstringer](http://twitter.com/paulstringer)

