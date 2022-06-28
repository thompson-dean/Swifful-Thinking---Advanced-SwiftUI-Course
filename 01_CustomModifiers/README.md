## Lesson 1 - How to create custom ViewModifiers.

This lesson is all about how to make custom ViewModifiers to clean up some messy code, or to aid in keeping views consistant.

you can add many ViewModifiers to your views in SwiftUI as show below.

```
Text("Hello World!")
    .foregroundColor(.white)
    .frame(height: 55)
    .frame(maxWidth: .infinity)
    .background(backgroundColor)
    .cornerRadius(10)
    .shadow(radius: 10)
```

Sometimes you will have many items that consist of the ViewModifiers and the code can get out of hand quite quickly, especially on bigger projects.
In this case it is a great idea to create a custom ViewModifier.

You can create ViewModifiers in a very similar to how a view is made.
The main difference is seen in its body function, where a parameter "content" is needed. This parameter refers to any View you will asign the modifiers too. Tou can add ViewModifiers on to content in the same manner you would with any View. For reference check the code below.

```
struct DefaultButtonViewModifier: ViewModifier {
    func body(content: Content) -> some View {

        content
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(.blue)
            .cornerRadius(10)
            .shadow(radius: 10)

    }
}
```

Now when you use this custom modifier (as below) it will take on every everything specified.

```
Text("Hello World!")
    .modifier(DefaultButtonViewModifier())
```

We can go one step further here by extending the View to make the custom ViewModifier similar to normal ViewModifiers. Like so

```
extension View {
    func withDefaultButtonFormatting() -> some View {
        modifier(DefaultButtonViewModifier())
    }
}
```

Now we can use the syntax below to use our custom ViewModifier! Quite neat!

```
Text("Hello World!")
    .withDefaultButtonFormatting()
```

If you want to make your custom ViewModifiers dynamic you can use the code below:

```
struct DefaultButtonViewModifier: ViewModifier {

    let backgroundColor: Color

    func body(content: Content) -> some View {

        content
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 10)

    }
}
```

```
extension View {
    func withDefaultButtonFormatting(with backgroundColor: Color = .blue) -> some View {
        modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
    }
}
```

```
Text("Hello Keiko!")
                .font(.subheadline)
                .withDefaultButtonFormatting(with: .red)
```
