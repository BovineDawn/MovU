//
//  MapViewRepresentable.swift
//  Movu
//
//  Created by JG on 7/30/25.
//
import SwiftUI
import MapKit

struct MapViewRepresentable: UIViewRepresentable {
    
    let mapView = MKMapView()
    let locationManager = LocationManager()
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    
    func makeUIView(context: Context) -> some UIView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        return mapView
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if let coordinate = locationViewModel.selectedLocationCoordinate {
            context.coordinator.addAndSelectAnnotation(withCoordinate: coordinate)
            context.coordinator.configurePolyline(witdhDestinationCoordinate: coordinate)

        }
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
}

extension MapViewRepresentable {
    class MapCoordinator: NSObject, MKMapViewDelegate {
                
        let parent: MapViewRepresentable
        
        var userLocationCoordinate: CLLocationCoordinate2D?
        
        init(parent: MapViewRepresentable) {
            self.parent = parent
            super.init()
        }
        
        // MKMapViewDelegate
        
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            self.userLocationCoordinate = userLocation.coordinate
            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            
            parent.mapView.setRegion(region, animated: true)

        }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) ->
            MKOverlayRenderer {
                let polyL = MKPolylineRenderer(overlay: overlay)
                polyL.strokeColor = .systemCyan
                polyL.lineWidth = 5
                return polyL
            }
        
        // Helpers
        
        func addAndSelectAnnotation(withCoordinate coordinate: CLLocationCoordinate2D) {
            parent.mapView.removeAnnotations(parent.mapView.annotations)
            let anno = MKPointAnnotation()
            anno.coordinate = coordinate
            parent.mapView.addAnnotation(anno)
            parent.mapView.selectAnnotation(anno, animated: true)
            
            parent.mapView.showAnnotations(parent.mapView.annotations, animated: true)
        }
        
        func configurePolyline(witdhDestinationCoordinate coordinate: CLLocationCoordinate2D) {
            guard let userLocationCoordinate = self.userLocationCoordinate else { return }
            getDestinationRoute(from: userLocationCoordinate, to: coordinate) { route in
                self.parent.mapView.addOverlay(route.polyline)
            }
            
        }
        
        func getDestinationRoute(from userLocation: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D, completion: @escaping(MKRoute) -> Void) {
        let userPlacemark = MKPlacemark(coordinate: userLocation)
        let dPlacemark = MKPlacemark(coordinate: destination)
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: userPlacemark)
        request.destination = MKMapItem(placemark: dPlacemark)
        let directions = MKDirections(request: request)
            
            directions.calculate { response, error in
                if let error = error {
                    print("DEBUG: Failed to get direction with error \(error.localizedDescription)")
                    return
                }
                guard let route = response?.routes.first else { return }
                completion(route)
            }
        }
    }
}


