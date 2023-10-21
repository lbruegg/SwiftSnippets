import UIKit

extension UIViewController {
    class var storyboardID: String {
        return "\(self)"
    }

    static func instantiate(fromAppStoryboard appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }

    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }

    func dismissTo(vc: UIViewController?, count: Int?, animated: Bool, completion: (() -> Void)? = nil) {

        var loopCount = 0
        var dummyVC: UIViewController? = self
        for _ in 0..<(count ?? 100) {
            loopCount += 1
            dummyVC = dummyVC?.presentingViewController
            if let dismissToVC = vc, dummyVC != nil && dummyVC!.isKind(of: dismissToVC.classForCoder) {
                dummyVC?.dismiss(animated: animated, completion: completion)
            }
        }

        if count != nil {
            dummyVC?.dismiss(animated: animated, completion: completion)
        }
    }
    func dismissTo(vc: UIViewController, animated: Bool, completion: ((UIViewController) -> Void)? = nil) {
        var currentVC: UIViewController = self
        while !currentVC.isKind(of: vc.classForCoder) {
            guard let presentingVC = currentVC.presentingViewController else { return }
            currentVC.dismiss(animated: animated, completion: nil)
            currentVC = presentingVC

        }
        completion?(currentVC)
    }
}

