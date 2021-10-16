import UIKit

class InputView: UIView {
    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var operationImage: UIImageView!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var equationView: UIView!
    @IBOutlet weak var spiderNetImage: UIImageView!

    func setTheme() {
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
    }

    private func configureSpiderNetImage() {
        spiderNetImage.image = R.image.net()?.withTintColor(.white)
    }
}
