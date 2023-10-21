// add https://github.com/ashleymills/Reachability.swift

import SystemConfiguration
import UIKit
import Reachability

public class ReachabilityManager {

    let reachability = try? Reachability()
    typealias BackdropHandler = (@MainActor () -> Void)

    func networkActions(reachability: Reachability, view: UIViewController, delegate: ImageConfirmationDialogViewControllerDelegate, backdropHandler: BackdropHandler? = nil) -> Bool {

        if reachability.connection != .unavailable {
            if reachability.connection == .wifi {
                print("Reachable via WiFi")
            } else {
                print("Reachable via Cellular")
            }
            return true
        } else {
            print("Not reachable")
            AlertHelper.showImageConfirmationAlertFor(confirmationType: .noConnection, viewController: view, delegate: delegate, backdropHandler: backdropHandler)
            return false
        }
    }
}

