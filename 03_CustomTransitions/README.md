## Lesson 3 - How to create custom Transitions.

Before getting into custom Transitions, I decided to review transitions brielfy.

```
struct TransitionsBootcamp: View {

    @State var showView: Bool = false

    var body: some View {
        ZStack(alignment: .bottom) {

            VStack {
                Button {
                    showView.toggle()
                } label: {
                    Text("BUTTON")
                }
                Spacer()
            }

            if showView {
                RoundedRectangle(cornerRadius: 30)
                    .frame(height: UIScreen.main.bounds.height / 2)
                    .transition(.asymmetric(
                        insertion: .move(edge: .leading),
                        removal: .move(edge: .bottom)
                    ))
                    .animation(.easeInOut)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}
```

Transitions are made so easy in SwiftUI. Just use .transition() on your view and you are good to go. Transition types include:

```
.opacity
.scale
.asymmetric(insertion: AnyTransition, removal: AnyTransition)
.move(edge: Edge)
.slide
```

#### Let's get into custom transitions!

First step is to set up your screen in a similar way to above where you would use a simple transition. i.e. have a @State boolean that toggles when a button is pressed to show your view or screen of choice.

```
struct CustomTransitionsBootcamp: View {
    @State private var showRectangle: Bool = false

    var body: some View {
        VStack {
            Spacer()

            if showRectangle {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 250, height: 350)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.rotateOn)
            }

            Spacer()

            Text("Click Me!")
                .withDefaultButtonViewModifier()
                .padding()
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        showRectangle.toggle()
                    }
                }
        }
    }
}
```

Second step is to create a custom ViewModifier.
here you can decide which animations or offsets you would like to use. in this example I chose a rotationEffect.

```
struct RotateViewModifier: ViewModifier {

    let rotation: Double

    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: rotation))
            .offset(
                x: rotation != 0 ? UIScreen.main.bounds.width : 0,
                y: rotation != 0 ? UIScreen.main.bounds.height : 0)
    }
}
```

The third step is to make an extension on AnyTransition. here you can use compututed properties or methods to complete your custom transitions.
active is what is happening when it is active and identity is when it is not. Asymmetric transitions are also able to be used here.

```
extension AnyTransition {

    static var rotating: AnyTransition {
        return AnyTransition.modifier(
            active: RotateViewModifier(rotation: 180),
            identity: RotateViewModifier(rotation: 0))
    }

    static func rotating(rotation: Double) -> AnyTransition {
        return AnyTransition.modifier(
            active: RotateViewModifier(rotation: rotation),
            identity: RotateViewModifier(rotation: 0))
    }

    static var rotateOn: AnyTransition {
        return AnyTransition.asymmetric(
            insertion: .rotating,
            removal: .move(edge: .leading))
    }
}
```

The above code can be rewritten like so:

```
extension AnyTransition {

    static var rotating: AnyTransition {
        modifier(
            active: RotateViewModifier(rotation: 180),
            identity: RotateViewModifier(rotation: 0))
    }

    static func rotating(rotation: Double) -> AnyTransition {
        modifier(
            active: RotateViewModifier(rotation: rotation),
            identity: RotateViewModifier(rotation: 0))
    }

    static var rotateOn: AnyTransition {
        asymmetric(
            insertion: .rotating,
            removal: .move(edge: .leading))
    }
}
```

This is because in the computed properties and methos we have specified the return type and swift is smart enough to know that. Also, since it is an extension of AnyTransition, It will also know that by default.
