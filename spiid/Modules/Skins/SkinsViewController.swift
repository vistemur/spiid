//
//  SkinsViewController.swift
//  spiid
//
//  Created by роман поздняков on 30/03/2019.
//  Copyright © 2019 romchick. All rights reserved.
//

import UIKit

final class SkinsViewController: UIViewController {
    
    private let xibFileName = "Skins"
    
    //MARK: - IBOutlets
    @IBOutlet weak var currentSkinImageView: UIImageView!
    @IBOutlet weak var skinsTableView: UITableView!
 
    // MARK: - Inits
    init() {
        super.init(nibName: xibFileName,
                   bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentSkinImageView.image = AppSettings.currentSkin.getSkinImage()
        
        let cellNib = UINib(nibName: SkinsTableViewCell.reuseId,
                            bundle: nil)
        skinsTableView.register(cellNib,
                                forCellReuseIdentifier: SkinsTableViewCell.reuseId)
        skinsTableView.delegate = self
        skinsTableView.dataSource = self
    }
    
    // MARK: - IBActions
    @IBAction private func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

extension SkinsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return Skin.allCases.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SkinsTableViewCell.reuseId,
                                                 for: indexPath)
        if let skinCell = cell as? SkinsTableViewCell {
            skinCell.updateContent(skin: Skin.allCases[indexPath.row])
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView,
                   heightForFooterInSection section: Int) -> CGFloat {
        return 0.7
    }
}

extension SkinsViewController: UITableViewDelegate {
   
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath,
                              animated: true)
        let currentSkin = Skin.allCases[indexPath.row]
        currentSkinImageView.image = currentSkin.getSkinImage()
        AppSettings.updateSkin(skin: currentSkin)
    }
}
