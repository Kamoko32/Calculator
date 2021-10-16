import UIKit
import RxSwift
import RxSwiftExt

class InputViewController: RxViewController<InputView> {
    let viewModel = InputViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }

    private func setupBindings() {
        customView.stepper.rx.value
            .map { Int($0) }
            .bind(to: viewModel.stepperValue)
            .disposed(by: bag)

        customView.slider.rx.value
            .map { Int($0) }
            .bind(to: viewModel.sliderValue)
            .disposed(by: bag)

        customView.segmentedControl.rx.value
            .map { .init(rawValue: $0) }
            .unwrap()
            .bind(to: viewModel.operation)
            .disposed(by: bag)

        viewModel.isCalculateButtonEnabled
            .bind(to: customView.calculateButton.rx.isEnabled)
            .disposed(by: bag)

        customView.calculateButton.rx.tap
            .bind(to: viewModel.calculate)
            .disposed(by: bag)
    }
}
