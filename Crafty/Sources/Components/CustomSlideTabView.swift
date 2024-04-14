import SwiftUI

struct CustomSlideTabView: View {
    @State private var tabSelection: Int = 0
    @Namespace private var namespace
    
    private let selectionOptions = ["New", "Returning"]
    
    init(initialIndex: Int = 0) {
        _tabSelection = State(initialValue: initialIndex)
    }
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                GeometryReader { geometry in
                    CustomTabSwitcher(width: geometry.size.width)
                }.zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                TabView(selection: $tabSelection) {
                    ForEach(selectionOptions.indices, id: \.self) { index in
                        TabContent(forIndex: index)
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .padding(.vertical)
            }
        }
    }
    
    private func CustomTabSwitcher(width: CGFloat) -> some View {
        HStack {
            ForEach(selectionOptions.indices, id: \.self) { index in
                Button(action: {
                    withAnimation {
                        tabSelection = index
                    }
                }) {
                    Text(selectionOptions[index])
                        .foregroundColor(tabSelection == index ? .accentColor: Color.GRAY_TERTIARY)
                        .padding(.top,30)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                }
            }
        }
        .background(
            Capsule()
                .fill(Color.accentColor)
                .frame(width: width / CGFloat(selectionOptions.count), height: 2)
                .matchedGeometryEffect(id: "tabIndicator", in: namespace)
                .frame(maxWidth: .infinity, alignment: tabSelection == 0 ? .leading : .trailing)
                .animation(.snappy, value: tabSelection),
            alignment: .bottomLeading
        )
    }
    
    private func TabContent(forIndex index: Int) -> some View {
        VStack {
            if index == 0 {
                SignUpView()
            } else {
                SignInView()
            }
        }
    }
}

struct CustomSlideTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSlideTabView(initialIndex: 0)
    }
}
