import SwiftUI

struct PersistanceChallenge: View {
    var body: some View {
        Header(name: "Persistance Challenge")
        NavigationStack {
            Text("User Defaults")
                .font(.largeTitle)
            HStack(spacing: 50) {
                NavigationLink { 
                    Save()
                } label: { 
                    VStack {
                        Image(systemName: "square.and.arrow.down.fill")
                            .font(.system(size: 100))
                        Text("In")
                            .font(.largeTitle)
                    }
                }
                NavigationLink { 
                    Retrieve()
                } label: { 
                    VStack {
                        Image(systemName: "square.and.arrow.up.fill")
                            .font(.system(size: 100))
                        Text("Out")
                            .font(.largeTitle)
                    }
                }
            }
        }
        .foregroundColor(.blue)
    }
}
