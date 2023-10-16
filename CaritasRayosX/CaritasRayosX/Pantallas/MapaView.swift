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
    @State private var region: MKCoordinateRegion = MKCoordinateRegion()
    @State var cities: [Marcador] = [
    Marcador(coordinate: .init(latitude: 25.649991, longitude: -100.290744))
    ]
    @State private var locationManager = CLLocationManager()

    var body: some View {
        VStack {
            Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems: cities, annotationContent: { city in
                MapMarker(coordinate: city.coordinate, tint: .red)
                })
                .onAppear() {
                    locationManager
                        .requestWhenInUseAuthorization()
                    region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitud, longitude: longitud), latitudinalMeters: 3000, longitudinalMeters: 3000)
                }
        }
        .ignoresSafeArea()
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
