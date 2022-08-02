## Lesson 7 - Animate Custom shapes with AnimateableData in SwiftUI

In this lesson we learnt how to animate custom shapes!
It is quite simple! The main difference between animating custom shapes and shapes of Apple's APIs is that you need to use AnimatableData. AnimatableData is needed as SwiftUI does not know the value of explicit paths in custom shapes. It has to be fed these values through AnimatableData with get {} set {}.

Below is an animationg of PacMan eating.

```
struct ContentView: View {

    @State private var animate: Bool = true

    var body: some View {

        ZStack {
            PacMan(offsetAmount: animate ? 20 : 0)
                .frame(width: 250, height: 250)

        }
        .onAppear {
            withAnimation(.easeInOut.repeatForever()) {
                animate.toggle()
            }
        }
    }
}

struct PacMan: Shape {

    var animatableData: Double {
        get { offsetAmount }
        set { offsetAmount = newValue }
    }

    var offsetAmount: Double

    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: -offsetAmount),
                endAngle: Angle(degrees: offsetAmount),
                clockwise: true)
        }
    }
}
```
