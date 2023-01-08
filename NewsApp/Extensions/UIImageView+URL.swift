import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(with url: URL?) {
        self.kf.indicatorType = .activity
        startAnimating()
        self.kf.setImage(with: url)
    }
}
