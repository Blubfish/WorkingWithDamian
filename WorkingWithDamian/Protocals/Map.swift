import SwiftUI
import MapKit

struct Map: UIViewRepresentable {
    typealias UIViewType = MKMapView
    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {}
}
