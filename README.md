# Choose-Your-Pill

App criado para fins de aprendizagem:
- SwiftUI para construção de interface;
- CoreData com SwiftUI
- Closures
   - [x] Closure Expression
     - [x] Inferring Type
     - [x] Shorthand Arguments
     - [x] Implicit returns  
   - [x] Normal Closure
   - [x] Trailing Closures
     - [x] Multiple Closures (Two+ closures. Ex.: fetch with completion closure and onFailure closure)
   - [x] Capture Value with Neasted Closure (Function that return a function. Function is a reference type, so when u call the function again, they use values saved on memory)
   ```swift
      func makeIncrementer(forIncrement amount: Int) -> () -> Int {
          var runningTotal = 0
          func incrementer() -> Int {
              runningTotal += amount
              return runningTotal
          }
          return incrementer
      }
      let incrementByTen = makeIncrementer(forIncrement: 10)
      incrementByTen()
      // returns a value of 10
      incrementByTen()
      // returns a value of 20
      incrementByTen()
      // returns a value of 30
   ```
   - [x] Autoclosure (Turn argument to a closure)
   ```swift
      // customersInLine is ["Ewa", "Barry", "Daniella"]
      func serve(customer customerProvider: @autoclosure () -> String) {
          print("Now serving \(customerProvider())!")
      }
      serve(customer: customersInLine.remove(at: 0))
      // Prints "Now serving Ewa!"
   ```
