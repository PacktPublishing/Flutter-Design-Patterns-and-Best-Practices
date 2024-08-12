import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate, LocalStorageApi {
    private let userDefaults = UserDefaults.standard
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
        LocalStorageApiSetup.setUp(binaryMessenger: controller.binaryMessenger, api: self)
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    func addFave(id: String) {
        toggleFavorite(id, isFavorite: true)
    }
    
    func removeFave(id: String) {
        toggleFavorite(id, isFavorite: false)
    }
    
    func getFaves() -> [FaveProduct] {
        let favesIds = getFavesIds()
        let faveProducts = favesIds.map { id in
            return FaveProduct(id: id)
        }
        return faveProducts
    }
    
    func isFave(id: String) -> Bool {
        return getFavesIds().contains(id)
    }
    
    private func getFavesIds() -> [String] {
        if let faves = userDefaults.array(forKey: "faves") as? [String] {
            return faves
        }
        return []
    }
    
    private func toggleFavorite(_ id: String, isFavorite: Bool) {
        var currentFaves = getFavesIds()
        if isFavorite {
            currentFaves.append(id)
        } else {
            currentFaves.removeAll { $0 == id }
        }
        userDefaults.set(currentFaves, forKey: "faves")
    }
}
