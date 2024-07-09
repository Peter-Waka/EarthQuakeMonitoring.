//
//  FavouritesController.swift
//  EarthQuakeMonitoring
//
//  Created by EMTECH MAC on 20/06/2024.
//

import UIKit
import MapKit

class FavouritesController: UIViewController  {
    
    //    var locations: [FavouritesModel] = []
    //
    //    var colloctionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    //    var favouritesCellRegistration: UICollectionView.CellRegistration<FavouritesLocationCell, FavouritesModel>!
    //
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //
    //        view.backgroundColor = .systemBackground
    //
    //        title = "Favourites"
    //
    //        setupCollectionView()
    //    }
    //
    //    func setupCollectionView() {
    //        let layout = UICollectionViewFlowLayout()
    //        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    //        view.addSubview(colloctionView)
    //        colloctionView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, paddingLeading: 8, paddingBottom: 8,
    //        paddingTrailing: 8)
    //        favouritesCellRegistration = UICollectionView.CellRegistration(handler: { (cell: FavouritesLocationCell, indexPath, favourite: FavouritesModel) in
    //
    //            let coordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: favourite.latitute, longitude: favourite.longitude)
    //
    //            cell.coordinates = coordinates
    //
    //            let placeMark = CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude)
    //
    //            placeMark.fetchLocationInformation { city, country, error in
    //                guard let city = city, let country = country, error == nil else {
    //                    return
    //                }
    //
    //                cell.city = city
    //                cell.country = country
    //            }
    //
    //        })
    //
    //        colloctionView.dataSource = self
    //
    //        colloctionView.delegate = self
    //
    //    }
    //
    //
    //
    //}
    //
    //extension FavouritesController: UICollectionViewDataSource {
    //
    //    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    //        return locations.count
    //    }
    //
    //    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    //
    //        let favouritesLocation = locations[indexPath.row]
    //
    //        return collectionView.dequeueConfiguredReusableCell(using: favouritesCellRegistration, for: indexPath, item: favouritesLocation)
    //    }
    //}
    
    //extension FavouritesController: UICollectionViewDelegate {
    //
    //
    //    
    //}
}
