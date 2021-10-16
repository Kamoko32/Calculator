import UIKit
import RxSwift

class InputViewController: RxViewController<InputView> {
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.setTheme()
        setupBindings()
    }

    private func setupBindings() {
        customView.stepper.rx.value
            .map { Int($0).description }
            .bind(to: customView.stepperLabel.rx.text)
            .disposed(by: bag)

        customView.slider.rx.value
            .map { Int($0).description }
            .bind(to: customView.sliderLabel.rx.text)
            .disposed(by: bag)

        customView.segmentedControl.rx.image
            .map { $0?.withTintColor(.black) }
            .bind(to: customView.operationImage.rx.image)
            .disposed(by: bag)
    }
}
