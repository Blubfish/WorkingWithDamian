import SwiftUI

struct Save: View {
    @AppStorage("number1") var number1: Int?
    @State var number2: Int?
    
    @AppStorage("url1") var url1: URL?
    @State var url2: URL?
    
    @AppStorage("arrayNumber1") var arrayNumber1: Double?
    @AppStorage("arrayNumber2") var arrayNumber2: Double?
    @AppStorage("arrayNumber3") var arrayNumber3: Double?
    
    @AppStorage("name") var name: String = ""
    @AppStorage("age") var age: Int?
    @AppStorage("phone") var phone: String = ""
    @State var contact: Contact = Contact()
    
    var body: some View {
        VStack {
            Group {
                Text("MVP")
                HStack {
                    TextField("Integer #1", value: $number1, format: .number)
                    TextField("Integer #2", value: $number2, format: .number)
                }
                .textFieldStyle(.roundedBorder)
                Button("Save") {
                    UserDefaults.standard.set(number2, forKey: "number2")
                }
                .frame(width: 200, height: 50)
                .foregroundColor(.white)
                .background(.blue)
                .clipShape(Capsule())
            }
            
            Group {
                Text("Stretch #1")
                VStack {
                    TextField("Enter URL #1", text: Binding(
                        get: { url1?.absoluteString ?? "" },
                        set: { url1 = URL(string: $0) }
                    ))
                    TextField("Enter URL #2", text: Binding(
                        get: { url2?.absoluteString ?? "" },
                        set: { url2 = URL(string: $0) }
                    ))
                }
                .autocorrectionDisabled(true)
                .textFieldStyle(.roundedBorder)
                Button("Save") {
                    UserDefaults.standard.set(url2, forKey: "url2")
                }
                .frame(width: 200, height: 50)
                .foregroundColor(.white)
                .background(.blue)
                .clipShape(Capsule())
            }
            
            Group {
                Text("Stretch #2")
                VStack {
                    HStack {
                        TextField("#1", value: $arrayNumber1, format: .number)
                        TextField("#2", value: $arrayNumber2, format: .number)
                        TextField("#3", value: $arrayNumber3, format: .number)
                    }
                }
                .textFieldStyle(.roundedBorder)
                
                Button("Save", action: {
                    var array: [Double] = []
                    if let number = self.arrayNumber1 {
                        array.append(number)
                    }
                    if let number = self.arrayNumber2 {
                        array.append(number)
                    }
                    if let number = self.arrayNumber3 {
                        array.append(number)
                    }
                    UserDefaults.standard.set(array, forKey: "array")
                })
                .frame(width: 200, height: 50)
                .foregroundColor(.white)
                .background(.blue)
                .clipShape(Capsule())
            }
            
            Group {
                Text("Stretch #3")
                VStack {
                    TextField("Enter Name", text: $name)
                    TextField("Enter Age", value: $age, format: .number)
                    TextField("Enter Phone", text: $phone)
                }
                .textFieldStyle(.roundedBorder)
                Button("Save") {
                    self.contact.name = self.name
                    self.contact.age = self.age
                    self.contact.phone = self.phone
                    if let json = try? JSONEncoder().encode(self.contact){
                        UserDefaults.standard.set(json, forKey: "contact")
                    }
                }
                .frame(width: 200, height: 50)
                .foregroundColor(.white)
                .background(.blue)
                .clipShape(Capsule())
            }
            
        }
        .frame(maxWidth: .infinity)
        .padding()
        .onAppear(perform: { () -> Void in
            self.number2 = UserDefaults.standard.integer(forKey: "number2")
            
            self.url2 = UserDefaults.standard.url(forKey: "url2")
            
            self.contact = { () -> Contact in
                if let json = UserDefaults.standard.data(forKey: "contact") {
                    if let contact = try? JSONDecoder().decode(Contact.self, from: json) as Contact {
                        return contact
                    }
                }
                return Contact()
            }()
        })
    }
}

