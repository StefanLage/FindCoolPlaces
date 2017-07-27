//
//  PlacesViewController.swift
//  FindCoolPlaces
//
//  Created by Stefan Lage on 27/07/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

import UIKit
import MapKit

class PlacesViewController: UIViewController {

    var viewModel: PlacesViewModel?

    // Location management
    let locationManager = CLLocationManager()
    var mapView: MKMapView!
    
    // Search places controller
    var searchController: UISearchController!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Bind the VM
        assert (self.viewModel != nil, "Kill it if we don't have any VM")
        guard self.viewModel != nil else {
            return
        }
        self.viewModel?.places.bindAndFire(listener: self.listener(places:))
        // Show the view below the navigation bar
        self.edgesForExtendedLayout = []
        self.configure()
        assert(self.mapView != nil, "the mapView should be set otherwise we can't go further")
        // Make sure the map is set
        guard self.mapView != nil else {
            return
        }
        self.configureConstraints()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**

     Configure subviews and internal objects

     */
    private func configure()
    {
        // Init location manager
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.requestLocation()

        // Set up the map
        self.mapView = MKMapView()
        self.mapView!.delegate = self
        self.mapView!.showsUserLocation = true
        self.mapView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.mapView)

        // Define the searchbar
        self.searchController = UISearchController(searchResultsController: nil)
        self.searchController.searchResultsUpdater = self
        let searchBar = self.searchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = Constants.Text.FCPSearchBarPlaceHolder
        navigationItem.titleView = self.searchController?.searchBar
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
    }
    
    /**

     Set up subviews contraints

     */
    private func configureConstraints()
    {
        // Define the size of the mapView -> match superview's frame
        let mapWidth = NSLayoutConstraint(item: self.mapView, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 1, constant: 0.0)
        let mapHeigth = NSLayoutConstraint(item: self.mapView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 1, constant: 0.0)
        let mapTop = NSLayoutConstraint(item: self.mapView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0.0)
        let mapLeading = NSLayoutConstraint(item: self.mapView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0.0)

        self.view.addConstraints([mapTop, mapWidth, mapLeading, mapHeigth])
    }
}

// MARK: - Binding method to View model
private typealias PlacesViewControllerViewModel = PlacesViewController
extension PlacesViewControllerViewModel{
    
    func listener(places: [PlaceViewModel?]) -> (){
        guard places.count > 0 else {
            // Do nothing
            return
        }
//        print (places[0]?.titleText)
        self.addNewPlaces(places: places as! [PlaceViewModel])
    }
}

// MARK: - Location manager delegate
extension PlacesViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Swift.Error) {
        print("error:: \(error.localizedDescription)")
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
    }

    /**

     Useful to do anything with the map when user's location is updated for instance

     */
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.first {
            // Zoom on current location
            let span = MKCoordinateSpanMake(0.1, 0.1)
            let region = MKCoordinateRegion(center: location.coordinate, span: span)
            self.mapView.setRegion(region, animated: true)
        }
    }
}

// MARK: - Search places delegate
extension PlacesViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        assert (viewModel != nil, "Kill it if we don't have any VM")
        guard viewModel != nil,
            let placeText = searchController.searchBar.text else {
            return
        }
        // Send location
        self.viewModel?.findPlaces(location: placeText)
    }
}

extension PlacesViewController : MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        let reuseId = Constants.ReusableValues.pin
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
        }
        pinView?.pinTintColor = UIColor.red
        pinView?.canShowCallout = true

        return pinView
    }

    /**

     Create annotation and add them to the map

     */
    internal func addNewPlaces(places: [PlaceViewModel])
    {
        // clear the map
        self.mapView.removeAnnotations(self.mapView.annotations)
        guard places.count > 0 else{
            // Don't do anything
            return
        }
        for (_, place) in places.enumerated() {
            let annotation = MKPointAnnotation()
            annotation.coordinate = place.coordinate!
            annotation.title = place.titleText
            // Add it to the map
            self.mapView.addAnnotation(annotation)
        }
        // Make sure all annotation are visible on the map
        self.mapView.showAnnotations(self.mapView.annotations, animated: true)
    }
}
