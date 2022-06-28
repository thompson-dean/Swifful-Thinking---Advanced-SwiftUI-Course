## Lesson 2 - How to create custom ButtonStyles.

Custom ButtonStyles work similarly to ViewModifiers.

I have implemented both in the example below to show you their similarity.

```
struct DefaultButtonViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(10)
            .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0.0, y: 10)
    }
}

struct PressableButtonStyle: ButtonStyle {

    let scaledAmount: Double

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaledAmount : 1.0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)

    }
}

extension View {
    func withDefaultButtonViewModifier() -> some View {
        self.modifier(DefaultButtonViewModifier())
    }
}

extension View {
    func withPressableButton(scaledAmount: Double = 1.01) -> some View {
        buttonStyle(PressableButtonStyle(scaledAmount: scaledAmount))
    }
}

struct ButtonStyleBootcamp: View {
    var body: some View {
        Button {

        } label: {
            Text("Click Me")
                .withDefaultButtonViewModifier()

        }
        .withPressableButton()
        .padding(40)
    }
}
```

The main difference is with the structs. ViewModifier use a body function that takes on content as a parameter,

```
func body(content: Content) -> some View { }
```

where content refers to the view that you are modifying.

ButtonStyle takes on a makeBody function where configuration is a parameter.

```
func makeBody(configuration: Configuration) -> some View { }
```

you can act on the buttons label configuration and have amounts change depending on whetehr the button is pressed or not.

Quite a simple fun lesson! Great way to clean up some code.
