//
//  MapaView.swift
//  EjemploMapas
//
//  Created by Alumno on 04/10/23.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapaView: View {
    @State var latitud: Double = 0.0
    @State var longitud: Double = 0.0
    @State private var isShowingAlert = true
    @State private var region: MKCoordinateRegion = MKCoordinateRegion()
    @State var cities: [Marcador] = [
    Marcador(coordinate: .init(latitude: 25.649991, longitude: -100.290744))
    ]

    var body: some View {
        VStack {
            Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems: cities, annotationContent: { city in
                MapMarker(coordinate: city.coordinate, tint: .red)
                })
                .onAppear() {
                    region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitud, longitude: longitud), latitudinalMeters: 3000, longitudinalMeters: 3000)
                }
        }
        .ignoresSafeArea()
        .alert(isPresented: $isShowingAlert) {
            Alert (
                title: Text("Abrir en Maps"),
                message: Text("¿Deseas acceder a esta ubicación en Maps?"),
                primaryButton: .default(Text("Abrir")) {
                    openInMaps()
                },
                secondaryButton: .cancel()
            )
        }
    }
    func openInMaps() {
        let coordinates = CLLocationCoordinate2D(latitude: latitud, longitude: longitud)
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinates))
        mapItem.name = "Ubicación personalizada"
        mapItem.openInMaps()
    }
}


struct Marcador: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}


struct MapaView_Previews: PreviewProvider {
    static var previews: some View {
        MapaView()
    }
}
