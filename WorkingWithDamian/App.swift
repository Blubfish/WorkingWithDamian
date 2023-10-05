import SwiftUI

enum Challenge {
    case Protocal
    case Persistance
    
    mutating func flip() {
        switch self {
        case .Persistance:
            self = .Protocal
        case .Protocal:
            self = .Persistance
        }
    }
}

@main
struct WorkingWithDamian: App {
    @State var challenge: Challenge = .Protocal
    
    var body: some Scene {
        WindowGroup {
            switch self.challenge {
            case .Persistance:
                PersistanceChallenge()
            case .Protocal:
                ProtocalChallenge()
            }
            Button("Switch", action: {
                self.challenge.flip()
            })
        }
    }
}
