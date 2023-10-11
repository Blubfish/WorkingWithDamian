import SwiftUI

struct ProtocalChallenge: View {
    @State var CoinValue = [Coin(name: "Penny", value: 1 ),
                                Coin(name: "Nickel", value: 5),
                                Coin(name: "Dime", value: 10),
                                Coin(name: "Quater", value: 25)]
    @State var TrapazoidShape = Trapazoid()
    var body: some View {
        Header(name: "Protocal Challenge")
        Spacer()
        Text("MVP Works")
            .modifier(MVPModifier())
        Stretch1()
            .frame(width: 300.0, height: 200.0)
        List{
            ForEach(CoinValue) { coin in
                HStack {
                    Text(coin.name)
                    Spacer()
                    Text(String(coin.value))
                }
            }
        }
        TrapazoidShape
        Spacer()
  
    }
}
