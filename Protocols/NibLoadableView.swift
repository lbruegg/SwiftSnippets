import UIKit

protocol NibLoadableView: AnyObject {
    static var nibName: String { get }

    func loadViewFromNib() -> UIView
}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }

    func loadViewFromNib() -> UIView {

        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        if let nibView = nib.instantiate(withOwner: self, options: nil).first as? UIView {
            return nibView
        }

        return UIView()
    }
}
