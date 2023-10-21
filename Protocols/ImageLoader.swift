import UIKit
import AlamofireImage

protocol ImageLoader: AnyObject {

    var imageView: UIImageView { get }

    var vSpinner: UIView? { get set }

    func downloadImage(urlString: String?)
}

// MARK: - downloadImage

extension ImageLoader {

    func downloadImage(urlString: String?) {

        self.showSpinner(onView: self.imageView)
        if let urlString: String = urlString, let url = URL(string: urlString) {

            eLog.debug(urlString)
            self.imageView.af.setImage(withURL: url, cacheKey: urlString, completion: { [weak self] _ in
                self?.removeSpinner()
            })
        }
    }

    func showSpinner(onView: UIView) {

        let spinnerView = UIView.init(frame: onView.bounds)

        let spinner = UIActivityIndicatorView.init(style: .medium)
        spinner.color = .gray
        spinner.startAnimating()
        spinner.center = spinnerView.center

        spinnerView.addSubview(spinner)
        onView.addSubview(spinnerView)

        self.vSpinner = spinnerView
    }

    func removeSpinner() {

        self.vSpinner?.removeFromSuperview()
        self.vSpinner = nil
    }
}

