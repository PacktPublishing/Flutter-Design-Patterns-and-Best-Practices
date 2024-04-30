import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    private let userDefaults = UserDefaults.standard
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
        
        let favesChannel = FlutterMethodChannel(
            name: "com.example.candy_store/faves",
            binaryMessenger: controller.binaryMessenger
        )
        
        favesChannel.setMethodCallHandler { [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) in
            guard let self = self else { return }
            
            switch call.method {
            case "getFaves":
                result(self.getFaves())
            case "addFave":
                if let args = call.arguments as? [String: Any], let id = args["id"] as? String {
                    self.toggleFavorite(id, isFavorite: true)
                    result(nil)
                } else {
                    result(FlutterError(code: "INVALID_VALUE", message: "id is null", details: nil))
                }
            case "removeFave":
                if let args = call.arguments as? [String: Any], let id = args["id"] as? String {
                    self.toggleFavorite(id, isFavorite: false)
                    result(nil)
                } else {
                    result(FlutterError(code: "INVALID_VALUE", message: "id is null", details: nil))
                }
            case "isFave":
                if let args = call.arguments as? [String: Any], let id = args["id"] as? String {
                    result(self.isFave(id))
                } else {
                    result(FlutterError(code: "INVALID_VALUE", message: "id is null", details: nil))
                }
            default:
                result(FlutterMethodNotImplemented)
            }
        }
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func getFaves() -> [String] {
        if let faves = userDefaults.array(forKey: "faves") as? [String] {
            return faves
        }
        return []
    }
    
    private func isFave(_ id: String) -> Bool {
        return getFaves().contains(id)
    }
    
    private func toggleFavorite(_ id: String, isFavorite: Bool) {
        var currentFaves = getFaves()
        if isFavorite {
            currentFaves.append(id)
        } else {
            currentFaves.removeAll { $0 == id }
        }
        userDefaults.set(currentFaves, forKey: "faves")
    }
}
