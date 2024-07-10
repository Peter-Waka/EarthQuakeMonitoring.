//
//  FavouritesController.swift
//  EarthQuakeMonitoring
//
//  Created by EMTECH MAC on 20/06/2024.
//

//import UIKit
//import MapKit
import UIKit
import RxSwift
import RxCocoa

//
//class FavouritesController: UIViewController  {
//    
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
//}


class FavouritesController: UIViewController  {
    var viewModel: EarthquakeViewModel
    
    init(viewModel: EarthquakeViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private let disposeBag = DisposeBag()

    private let tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
//        NavigationBarItem.title = "Welcome"
//        title = "Earthquakes Data"
        setupUI()
        setupBindings()
        viewModel.fetchEarthquakes.onNext(())
    }

    private func setupUI() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func setupBindings() {
        viewModel.earthquakes
            .observe(on: MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self)) { row, element, cell in
                cell.textLabel?.numberOfLines = 0  // Allow multiline text in cell
                cell.textLabel?.text = """
                Magnitude: \(element.magnitude)
                Place: \(element.place)
                Time: \(element.time)
                Coordinates: \(element.coordinates.latitude), \(element.coordinates.longitude)
                """
            }
            .disposed(by: disposeBag)

        tableView.rx.modelSelected(EarthquakeData.self)
            .subscribe(onNext: { [weak self] earthquake in
                self?.showMapForEarthquake(earthquake)
            })
            .disposed(by: disposeBag)
    }


    private func showMapForEarthquake(_ earthquake: EarthquakeData) {
        let mapViewController = MapViewController()
        mapViewController.earthquake = earthquake
        navigationController?.pushViewController(mapViewController, animated: true)
    }

}

