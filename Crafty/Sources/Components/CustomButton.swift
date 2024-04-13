import SwiftUI

struct Props {
    let title: String
    var action: () -> Void
    var titleColor: Color
    var fontSize: CGFloat
    var width: CGFloat?
    var height: CGFloat
    var backgroundColor: Color
    var cornerRadius: CGFloat
    var borderColor: Color
    var borderWidth: CGFloat
    
    init(title: String,
         action: @escaping () -> Void = {},
         titleColor: Color = .white,
         fontSize: CGFloat = 16,
         width: CGFloat? = nil,
         height: CGFloat = 40,
         backgroundColor: Color = Color.accentColor,
         cornerRadius: CGFloat = 8,
         borderColor: Color = .clear,
         borderWidth: CGFloat = 0) {
        self.title = title
        self.action = action
        self.titleColor = titleColor
        self.fontSize = fontSize
        self.width = width
        self.height = height
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.borderColor = borderColor
        self.borderWidth = borderWidth
    }
}

struct CustomButton: View {
    let props: Props
    
    var body: some View {
        Button(action: props.action) {
            Text(props.title)
                .foregroundColor(props.titleColor)
                .font(.system(size: props.fontSize, weight: .semibold))
                .frame(maxWidth: props.width ?? .infinity,maxHeight: props.height)
                .background(RoundedRectangle(cornerRadius: props.cornerRadius)
                    .fill(props.backgroundColor))
                    .overlay(RoundedRectangle(cornerRadius: props.cornerRadius)
                    .stroke(props.borderColor, lineWidth: props.borderWidth))
        }
    }
}
// Preview
struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(props: Props(
            title: "Transparent Button",
            action: {
                // Action for the button
                print("Transparent Button Tapped")
            }
        ))
    }
}
