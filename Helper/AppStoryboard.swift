import UIKit

enum AppStoryboard: String {

    case Main, Registration, Alerts, Login, Profile, Provider, Search, Notifications, AddVehicle, VehicleManagement, VehicleManagementOverlay, CPackActivation, CPackConfiguration, VehicleConfiguration, VehicleDetails, MapViewOverlays, Privacy, ChargeGroup, RoutePlanning, RouteDetails, FilterSearch, VehicleStatistics, TBT

    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }

    func viewController<T: UIViewController>(viewControllerClass: T.Type) -> T {

        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID

        guard let scene = instance.instantiateViewController(withIdentifier: storyboardID) as? T else {
            fatalError("ViewController with identifier \(storyboardID), not found in \(self.rawValue) Storyboard")
        }

        return scene
    }
}
