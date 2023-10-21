import UIKit

protocol BottomView: AnyObject {

    var vDismiss: UIView! { get set }
}

extension BottomView where Self: UIViewController {

    func addGestures() {

        let panGestureSettings = UIPanGestureRecognizer(target: self, action: #selector(didSwipeBottomView(_:)))
        self.view.addGestureRecognizer(panGestureSettings)
        let tapSettings = UITapGestureRecognizer(target: self, action: #selector(close))
        vDismiss.addGestureRecognizer(tapSettings)
        let swipeSettings = UISwipeGestureRecognizer(target: self, action: #selector(close))
        vDismiss.addGestureRecognizer(swipeSettings)

    }
}

private extension UIViewController {

    @objc func didSwipeBottomView(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .changed:
            if sender.translation(in: view).y > 0 {
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.view.transform = CGAffineTransform(translationX: 0, y: sender.translation(in: self.view).y)
                })
            }
        case .ended:
            if sender.translation(in: view).y < 50 {
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.view.transform = .identity
                })
            } else {
                dismiss(animated: true, completion: nil)
            }
        default:
            break
        }
    }

    @objc func close(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

