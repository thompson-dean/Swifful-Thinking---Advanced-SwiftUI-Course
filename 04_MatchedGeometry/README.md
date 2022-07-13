## Lesson 4 - How to use MatchedGeometryEffect.

Matched Geometry Effect is extremely convenient for animating shapes.

You can animate shapes around the screen using offset and that is all well and good but it is not as exact and doesn't allow you to transform shapes sizes too. Rather than using the offset use MatcheGeometryEffect. When using matched geometry effect you can link two or more shapes using the modifier .matchedGeometryEffect(id: Hashable, in: ID.Namespace).

Please check out the example below. Here a simple Rounded Rectangle is being moved up and down the scfreen using Matched Geometry Effect. When screen is clicked the boolean will change and the RoundedRectangle will moved to the position of the other RoundedRectangle.

```
struct MatchedGeometryEffectBootcamp: View {

    @State private var isClicked: Bool = false
    @Namespace private var namespace

    var body: some View {
            VStack {

                if !isClicked {
                    RoundedRectangle(cornerRadius: 25.0)
                        .matchedGeometryEffect(id: "rectangle", in: namespace)
                        .frame(width: 100, height: 100)

                }

                Spacer()

                if isClicked {
                    RoundedRectangle(cornerRadius: 25.0)
                        .matchedGeometryEffect(id: "rectangle", in: namespace)
                        .frame(width: 300, height: 200)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.red)
            .onTapGesture {
                withAnimation(.easeInOut) {
                    self.isClicked.toggle()
                }
            }
    }
}
```

MatchGeometryEffect is also very practical!

In the example below we created an underline that moves the selected text.

```
struct MatchedGeometryEffectExample2: View {

    let categories: [String] = ["Home", "Popular", "Saved"]
    @State private var selected: String = ""
    @Namespace private var namespace


    var body: some View {
        HStack {
            ForEach(categories, id: \.self) { category in
                ZStack(alignment: .bottom) {
                    if selected == category {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.red.opacity(0.5))
                            .matchedGeometryEffect(id: "category_background", in: namespace)
                            .frame(width: 35, height: 2)
                            .offset( y: 10)
                    }

                    Text(category)
                        .foregroundColor(selected == category ? .red : .primary)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .onTapGesture {
                    withAnimation(.spring()) {
                        selected = category
                    }
                }
            }
        }
        .padding()
    }
}
```
