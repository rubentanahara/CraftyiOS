import SwiftUI

struct CustomTextFieldProps {
    var label: String
    var placeholder: String
    var text: Binding<String>
    var fontSize: CGFloat = 14
    var textColor: Color = Color.BLACK_PRIMARY
    var placeholderColor: Color = Color.GRAY_TERTIARY
    var backgroundColor: Color = Color.WHITE_PRIMARY
    var borderColor: Color = Color.GRAY_TERTIARY
    var borderWidth: CGFloat = 1
    var cornerRadius: CGFloat = 8
    var padding: CGFloat = 15
}

struct CustomTextField: View {
    let props: CustomTextFieldProps

    var body: some View {
        VStack(alignment: .leading) {
            Text(props.label)
                .font(.system(size: props.fontSize))
                .foregroundColor(props.textColor)
            TextField(props.placeholder, text: props.text)
                .font(.system(size: props.fontSize))
                .padding(.horizontal)
                .padding(.vertical, props.padding)
                .frame(height: 40)
                .background(props.backgroundColor)
                .overlay(RoundedRectangle(cornerRadius: props.cornerRadius)
                            .stroke(props.borderColor, lineWidth: props.borderWidth))
                .cornerRadius(props.cornerRadius)
        }
        .frame(maxWidth: .infinity)
    }
}


struct CustomTextField_Previews: PreviewProvider {
    @State static var previewText = ""

    static var previews: some View {
        CustomTextField(props: CustomTextFieldProps(
            label: "Email or Username",
            placeholder: "Enter your email or username",
            text: $previewText
        ))
        .padding()
        .previewLayout(.sizeThatFits)
    }
}

