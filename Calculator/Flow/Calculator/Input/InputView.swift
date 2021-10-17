import UIKit
import RxSwift

class InputView: RxView {
    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var operationImage: UIImageView!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var equationView: UIView!
    @IBOutlet weak var spiderNetImage: UIImageView!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var operationView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setTheme()
        setupBindings()
    }
    
    private func setTheme() {
        configureStepper()
        configureEquationView()
        configureSpiderNetImage()
    }

    private func configureStepper() {
        stepper.maximumValue = .infinity
        stepper.layer.cornerRadius = 4
        stepper.setDecrementImage(stepper.decrementImage(for: .normal), for: .normal)
        stepper.setIncrementImage(stepper.incrementImage(for: .normal), for: .normal)
        stepper.tintColor = .white
    }

    private func configureEquationView() {
        equationView.layer.cornerRadius = 4
        operationImage.layer.cornerRadius = 4
        operationView.layer.cornerRadius = 4
    }

    private func configureSpiderNetImage() {
        spiderNetImage.image = R.image.net()?.withTintColor(.white)
    }

    private func setupBindings() {
        stepper.rx.value
            .map { Int($0).description }
            .bind(to: stepperLabel.rx.text)
            .disposed(by: bag)

        slider.rx.value
            .map { Int($0).description }
            .bind(to: sliderLabel.rx.text)
            .disposed(by: bag)

        segmentedControl.rx.image
            .map { $0?.withTintColor(.black) }
            .bind(to: operationImage.rx.image)
            .disposed(by: bag)
    }
}
