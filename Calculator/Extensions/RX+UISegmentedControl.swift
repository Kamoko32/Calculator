import RxCocoa
import RxSwift

extension Reactive where Base: UISegmentedControl {
    public var image: ControlProperty<UIImage?> {
        return controlProperty(
            editingEvents: [.allEditingEvents, .valueChanged],
            getter: { segment in
                segment.imageForSegment(at: segment.selectedSegmentIndex)
            }, setter: { segment, image in
                segment.setImage(image, forSegmentAt: segment.selectedSegmentIndex)
            }
        )
    }
}
