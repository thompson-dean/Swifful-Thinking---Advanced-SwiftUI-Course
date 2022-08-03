## Lesson 8 - How to Use Generics in SwiftUI

In this lesson we learnt all about Generics. Using Generics we can make a single class definition with a placeholder, that the user can specify at the time time of declaring the object. In simpler words it allows or functions or Structs to be used with many different types.

If you look at the code below, I have created a linearSearch function to return the index of an item we are searching for in an array.

```
let intArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]

let letterArray = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"]

func findIndex(array: [String], key: String) -> Int? {
    for (index, item) in array.enumerated() {
        if key == item {
            return index
        }
    }
        return nil
}

findIndex(array: letterArray, key: "c") //will compile
findIndex(array: intArray, key: 1) //will not compile
```

In this case we are unable to parse the intArray as it does not contain String types. So how to we overcome this!? Using Generics!

Let's redefine the func so that it has a custom type T.

```
func findIndex<T: Comparable>(array: [T], key: T) -> Int? {
    for (index, item) in array.enumerated() {
        if key == item {
            return index
        }
    }
        return nil
}
```

We have created a custom type called T that can be of any type. Aslong as T are all of the same type the function will run.

Now when we call both functions they will work!

```
findIndex(array: letterArray, key: "c") //will compile
findIndex(array: intArray, key: 1) //will compile
```

Generics can also be used in SwiftUI Views as below:

```
struct GenericView<T: View>: View {
    let content: T

    let title: String

    var body: some View {
        VStack {
            Text(title)
            content
        }

    }
}
```

There will be more on Generics and ViewBuilders in the next lesson from SwiftfulThinking.
