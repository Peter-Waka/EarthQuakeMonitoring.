//import CoreData
//
//class CoreDataService {
//    static let shared = CoreDataService()
//    
//    private init() {}
//    
//    lazy var persistentContainer: NSPersistentContainer = {
//        let container = NSPersistentContainer(name: "FavouritesModel")
//        container.loadPersistentStores { (storeDescription, error) in
//            if let error = error as NSError? {
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        }
//        return container
//    }()
//    
//    var context: NSManagedObjectContext {
//        return persistentContainer.viewContext
//    }
//    
//    func addLocation(name: String, country: String, longitude: Double, latitude: Double) {
//        let context = persistentContainer.viewContext
//        
//        guard let entity = NSEntityDescription.entity(forEntityName: "FavouritesModel", in: context) else {
//            print("Failed to find entity description for Favourites")
//            return
//        }
//        
//        let location = NSManagedObject(entity: entity, insertInto: context)
//        location.setValue(name, forKey: "name")
//        location.setValue(country, forKey: "country")
//        location.setValue(longitude, forKey: "longitude")
//        location.setValue(latitude, forKey: "latitude")
//        
//        do {
//            try context.save()
//        } catch {
//            print("Failed to save location: \(error.localizedDescription)")
//        }
//    }
//    
//    func fetchLocation() -> [FavouritesModel] {
//        let context = persistentContainer.viewContext
//        let fetchRequest = NSFetchRequest<FavouritesModel>(entityName: "FavouritesModel")
//        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
//        fetchRequest.sortDescriptors = [sortDescriptor]
//        
//        do {
//            let locationList = try context.fetch(fetchRequest)
//            return locationList
//        } catch {
//            print("Failed to fetch locations: \(error.localizedDescription)")
//            return []
//        }
//    }
//}
