import UIKit

extension UIScrollView {
    func scrollToTop(animated: Bool) {
        setContentOffset(CGPoint(x: 0, y: 0), animated: animated)
    }
}
