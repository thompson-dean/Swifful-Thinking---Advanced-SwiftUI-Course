## Lesson 5 - Custom Shapes in SwiftUI

This lesson is sort of a recap of what I had previously learnt in other courses.
SwiftUI comes with many built in shapes like Rectangle(), RoundedRectangle(), Circle(), etc. And these are great but at times you want to make your own shapes. And luckily that is super easy in SwiftUI.

Create a new struct for your shape and give it the property of Shape. Inside the strict you will be required to make a function called path. Within the path function you need to draw the lines of your custom shapes using path.move(to: ) to mark the starting place, and path.addLine(to: ) to draw each line. Draw your lines back to your starting point and you have your custom shape.

Here is a Triangle

```
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        }
    }
}
```

Here is a Rhombus

```
struct Rhombus: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let horizontalOffset: CGFloat = rect.width * 0.2
            path.move(to: CGPoint(x: rect.minX + horizontalOffset, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX - horizontalOffset, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + horizontalOffset, y: rect.minY))
        }
    }
}
```
