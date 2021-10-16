import UIKit
import RxSwift
import RxCocoa
import RxSwiftExt

class InputViewController: RxViewController<InputView> {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }

    private func setupBindings() {
        customView.stepper.rx.value
            .map { $0.rounded().description }
            .bind(to: customView.stepperLabel.rx.text)
            .disposed(by: bag)

        customView.slider.rx.value
            .map { Int($0).description }
            .bind(to: customView.sliderLabel.rx.text)
            .disposed(by: bag)

        customView.operationSegmentedControl.rx.selectedSegmentIndex
            .map { [weak self] index in
                self?.customView.operationSegmentedControl.imageForSegment(at: index)
            }
            .bind(to: customView.operationImage.rx.image)
            .disposed(by: bag)
    }
}
