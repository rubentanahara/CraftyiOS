import SwiftUI

enum ImageName: String {
    case CRAFTY_LOGO
}

extension Image {
    init(name: ImageName){
        self.init(name.rawValue)
    }
    
}
