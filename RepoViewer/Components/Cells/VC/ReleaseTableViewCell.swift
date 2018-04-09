//
//  ReleaseTableViewCell.swift
//  RepoViewer
//
//  Created by Łukasz Szpyrka on 02/04/2018.
//  Copyright © 2018 Łukasz Szpyrka. All rights reserved.
//

import UIKit

class ReleaseTableViewCell: BaseTableViewCell, SafariOpenableCell {

    @IBAction func openUrl(_ sender: Any) {
    }
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var releaseTag: UILabel!
    @IBOutlet weak var authorImg: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var publishDateLabel: UILabel!
    
    weak var safariDelegate: SafariOpenableCellDelegate?

    func setSafariDelegate(sd: SafariOpenableCellDelegate) {
        safariDelegate = sd
    }

    override func setCellModel(vm: CellViewModelProtocol) {
        self.viewModel = vm
        guard let repoViewModel = self.viewModel as? RepositoryCellVM else {
            return
        }
        name.text = repoViewModel.name

    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
