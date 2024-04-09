import SwiftUI

enum AppStorageKey: String {
    case isOnboardingDone
}

final class AppState: ObservableObject {
    @AppStorage("isOnboardingDone") var isOnboardingDone: Bool = false
}
