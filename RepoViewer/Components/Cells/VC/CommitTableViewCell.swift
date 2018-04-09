//
//  CommitTableViewCell.swift
//  RepoViewer
//
//  Created by Łukasz Szpyrka on 02/04/2018.
//  Copyright © 2018 Łukasz Szpyrka. All rights reserved.
//

import UIKit

class CommitTableViewCell: BaseTableViewCell {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var commiterName: UILabel!
    @IBOutlet weak var comment: UITextView!
    @IBOutlet weak var date: UILabel!

    override func setCellModel(vm: CellViewModelProtocol) {
        self.viewModel = vm
        guard let commitViewModel = self.viewModel as? CommitCellVM else {
            return
        }
        self.comment.text = commitViewModel.comment
        self.commiterName.text = commitViewModel.comment
        //self.language.text = repoViewModel.language

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
