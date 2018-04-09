//
//  GeneralTableViewController.swift
//  RepoViewer
//
//  Created by Łukasz Szpyrka on 01/04/2018.
//  Copyright © 2018 Łukasz Szpyrka. All rights reserved.
//

import UIKit
protocol GeneralTableViewControllerDelegate: class {
    func didSelectCell()
    func didSelectCellWith(repo: Repository)
}

class GeneralTableViewController<T>: UITableViewController where T: TableViewModelProtocol, T:BaseViewModel {

    private var _viewModel: T
    weak var delegate: GeneralTableViewControllerDelegate?
    var indicator: UIActivityIndicatorView?

    required init(viewModel: T) {

        _viewModel = viewModel
        super.init(style: .plain)
        _viewModel.delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        startAnimatingIndicator()
        self.tableView.register(UINib(nibName:_viewModel.cellIdentifier(), bundle: Bundle.main),
                                forCellReuseIdentifier: _viewModel.cellIdentifier())
        _viewModel.fetchData()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return _viewModel.numberOfSections()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return _viewModel.numberOfRows()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: _viewModel.cellIdentifier(), for: indexPath) as? BaseTableViewCell,
              let cellViewModel = _viewModel.modelAt(index: indexPath.row)  else {
            return UITableViewCell.defaultCell()
        }
        cell.setCellModel(vm: cellViewModel)
        guard let safariCell = cell as? SafariOpenableCell else{
            return cell
        }
        safariCell.setSafariDelegate(sd: self)
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return _viewModel.heightOfRow()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        _viewModel.didSelect(row: indexPath.row)
    }
}
extension GeneralTableViewController: BaseViewModelDelegate {

    func refreshUI() {
        stopAnimatingIndicator()
        self.tableView.reloadData()
    }

    func finishVC() {
        delegate?.didSelectCell()
    }
    func showAlert(title: String, mgs: String) {
        let alert = UIAlertController(title: title, message: mgs, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Constants.Errors.ok, style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
extension GeneralTableViewController: RepositoryDetailsViewModelDelegate {
    func finishWith(repo: Repository) {
        delegate?.didSelectCellWith(repo: repo)
    }

}

extension GeneralTableViewController: SafariOpenableCellDelegate {
    func openSafari(url: String) {

        guard let url: URL = URL(string: url)  else {
            return
        }
        UIApplication.shared.open(url)

    }


}
