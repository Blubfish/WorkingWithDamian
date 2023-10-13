import SwiftUI

struct Retrieve: View {
    @AppStorage("number1") var number1: Int?
    @State var number2: Int? = UserDefaults.standard.integer(forKey: "number2")
    
    @AppStorage("url1") var url1: URL?
    @State var url2: URL? = UserDefaults.standard.url(forKey: "url2")
    
    @State var array: [Double] = []
    
    @State var name = ""
    @State var age = ""
    @State var phone = ""
 
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Group {
                Text("MVP")
                HStack {
                    if let number = self.number1 {
                        Text("Number1: \(number)")
                    }
                }
                HStack {
                    if let number = self.number2 {
                        Text("Number2: \(number)")
                    }
                }
            }
            Group {
                Text("Stretch #1")
                if let url = self.url1 {
                    Link("Load URL #1", destination: url)
                }
                if let url = self.url2 {
                    Link("Load URL #2", destination: url)
                }
            }
            Group {
                Text("Stretch #2")
                ForEach(self.array, id: \.self) { value in
                    Text("\(value) ")
                }  
            }
            Group {
                Text("Stretch #3")
                HStack {
                    if self.name != "" {
                        Text("Name: \(self.name)")
                    }
                }
                HStack {
                    if self.age != "" {
                        Text("Age: \(self.age)")
                    }
                }
                HStack {
                    if self.name != "" {
                        Text("Phone Number: \(self.phone)")
                    }
                }  
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .font(.title)
        .onAppear(perform: {
            self.number2 = UserDefaults.standard.integer(forKey: "number2")
            
            self.url2 = UserDefaults.standard.url(forKey: "url2")
            
            self.array = { () -> [Double] in
                if let array = UserDefaults.standard.array(forKey: "array") {
                    return array as! [Double]
                }
                return []
            }()
            
            let contact = { () -> Contact in
                if let json = UserDefaults.standard.data(forKey: "contact") {
                    if let contact = try? JSONDecoder().decode(Contact.self, from: json) as Contact {
                        return contact
                    }
                }
                return Contact()
            }()
            self.name = contact.name
            if let age = contact.age {
                self.age = String(age)
            }
            self.phone = contact.phone
        })
    }
}

