import UIKit

// Shim to compile with older Xcodes.
#if !swift(>=4.2)
extension UIApplication {
typealias LaunchOptionsKey = UIApplicationLaunchOptionsKey
}
#endif

@UIApplicationMain
class AppDelegate: NSObject, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("app loaded, so now we party!")
        return true
    }
}
