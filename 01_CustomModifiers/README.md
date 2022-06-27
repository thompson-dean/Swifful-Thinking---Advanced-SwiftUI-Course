## Lesson 1 - How to create custom ViewModifiers.

This lesson is all about how to make custom ViewModifiers to clean up some messy code, or to aid in keeping views consistant.

```
Text("Hello World!")
    .foregroundColor(.white)
    .frame(height: 55)
    .frame(maxWidth: .infinity)
    .background(backgroundColor)
    .cornerRadius(10)
    .shadow(radius: 10)
```

ViewModifier

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

```
Text("Hello World!")
    .withDefaultButtonFormatting()
```

To make it a view extension

```
extension View {
    func withDefaultButtonFormatting() -> some View {
        modifier(DefaultButtonViewModifier())
    }
}
```

To make a parameter dynamic, you can do things like:

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
