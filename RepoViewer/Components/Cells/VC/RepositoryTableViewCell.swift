//
//  RepositoryTableViewCell.swift
//  RepoViewer
//
//  Created by Łukasz Szpyrka on 01/04/2018.
//  Copyright © 2018 Łukasz Szpyrka. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: BaseTableViewCell, SafariOpenableCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var language: UILabel!
    weak var safariDelegate: SafariOpenableCellDelegate?

    func setSafariDelegate(sd: SafariOpenableCellDelegate) {
        safariDelegate = sd
    }
    @IBAction func openUrl(_ sender: Any) {
        guard let repoViewModel = self.viewModel as? RepositoryCellVM else {
            return
        }
        safariDelegate?.openSafari(url: repoViewModel.url   )
    }

    override func setCellModel(vm: CellViewModelProtocol) {
        self.viewModel = vm
        guard let repoViewModel = self.viewModel as? RepositoryCellVM else {
            return
        }
        self.name.text = repoViewModel.name
        self.language.text = repoViewModel.language

    }

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
