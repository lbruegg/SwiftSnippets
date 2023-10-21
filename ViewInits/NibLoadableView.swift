import UIKit

class ViewName: UIView, NibLoadableView {

    // MARK: - Init
    required init() {
        super.init(frame: .zero)
        self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }

    private func setup() {
        let view = self.loadViewFromNib()
        addSubview(view)
        view.frame = self.bounds

    }
}

