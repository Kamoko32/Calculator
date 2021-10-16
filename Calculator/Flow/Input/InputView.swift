import UIKit

class InputView: UIView {
    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var operationImage: UIImageView!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var operationSegmentedControl: UISegmentedControl!
    @IBOutlet weak var slider: UISlider!

    override func layoutSubviews() {
        super.layoutSubviews()
        stepper.maximumValue = .infinity
        stepper.minimumValue = 0
    }
}
