import SwiftUI

struct CustomButtonProps {
    var title: String = "title"
    var action: () -> Void = {}
    var titleColor: Color = Color.WHITE_PRIMARY
    var fontSize: CGFloat = 16
    var width: CGFloat? = nil
    var height: CGFloat = 40
    var backgroundColor: Color = Color.accentColor
    var cornerRadius: CGFloat = 8
    var borderColor: Color = .clear
    var borderWidth: CGFloat = 0
}

struct CustomButton: View {
    let props: CustomButtonProps
    
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

#Preview {
    CustomButton(props: CustomButtonProps())
}

