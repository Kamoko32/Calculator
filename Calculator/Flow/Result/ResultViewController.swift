import UIKit
import RxSwift
import RxSwiftExt

class ResultViewController: RxViewController<ResultView> {
    let viewModel = ResultViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }

    private func setupBindings() {
        viewModel.isDownloading.observeOnMain().subscribe(onNext: { [weak self] isDownloading in
            self?.customView.indicator.isHidden = !isDownloading
            self?.customView.resultLabel.isHidden = isDownloading
            isDownloading ? self?.customView.indicator.startAnimating() : self?.customView.indicator.stopAnimating()
        }).disposed(by: bag)

        viewModel.result
            .bind(to: customView.resultLabel.rx.text)
            .disposed(by: bag)
    }
}
