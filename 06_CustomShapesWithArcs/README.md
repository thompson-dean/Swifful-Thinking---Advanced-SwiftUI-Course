## Lesson 6 - Custom Shapes with Arcs and Quad Cruves in SwiftUI

In this lesson we learnt how to create custom shapes with arcs and curves.
Both ways are able to be used with what we learnt in the last lesson about path.move(to: ) and path.addLine(to: )

The first way is to use path.addArc(center: , radius: , startAngle: , endAngle: , clockwise: )

The code below shows how easy it is to make custom shapes in SwiftUI.

```
struct ShapeWithArc: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))

            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY ),
                radius: rect.height / 2,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 180),
                clockwise: false)

            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        }

    }
}
```

The next way to create more complex curves is path using Quad Curves or in code path.adQuadCurve(to: , control: )

```
struct WaterShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.midY))
            path.addQuadCurve(
                to: CGPoint(x: rect.midX, y: rect.midY),
                control: CGPoint(x: rect.width * 0.25, y: rect.height * 0.4))

            path.addQuadCurve(
                to: CGPoint(x: rect.maxX, y: rect.midY),
                control: CGPoint(x: rect.width * 0.75, y: rect.height * 0.6))

            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}
```
