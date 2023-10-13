import SwiftUI

struct ProtocalChallenge: View {
    @State var CoinValues = [
        Coin(name: "Penny", value: 1 ),
        Coin(name: "Nickel", value: 5),
        Coin(name: "Dime", value: 10),
        Coin(name: "Quarter", value: 25)
    ]

    var body: some View {
        Header(name: "Protocal Challenge")
        Spacer()
        Text("MVP Works")
            .modifier(MVPModifier())
        Map()
            .frame(width: 300.0, height: 200.0)
        List(self.CoinValues) { coin in
            HStack {
                Text(coin.name)
                Spacer()
                Text(String(coin.value) + "¢")
            }
        }
        Trapezoid()
        Spacer()
    }
}
