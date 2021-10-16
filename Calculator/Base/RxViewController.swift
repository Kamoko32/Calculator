import UIKit
import RxSwift
import RxCocoa

class RxViewController<View: UIView>: UIViewController, HasCustomView {
    typealias CustomView = View
    let bag = DisposeBag()
}
