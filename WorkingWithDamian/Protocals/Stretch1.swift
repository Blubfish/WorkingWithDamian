import SwiftUI
import MapKit

struct Stretch1: UIViewRepresentable{
    typealias UIViewType = MKMapView
    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
      
    }
    
}


