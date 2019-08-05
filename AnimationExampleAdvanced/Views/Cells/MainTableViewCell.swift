/*
 * Copyright (c) Francisco Obarrio - fobarrio@gmail.com
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit

class MainTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var cellBackground: UIView!    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var plusImageView: UIImageView!
    @IBOutlet weak var playImageView: UIImageView!
    @IBOutlet weak var likeImageView: UIImageView!
    @IBOutlet weak var cancelImageView: UIImageView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var mainTitleLbl: UILabel!
    @IBOutlet weak var albumTitle: UILabel!
    @IBOutlet weak var albumYearLbl: UILabel!
    
    
    
    // MARK: Initialization
    fileprivate var stateCel:Int = 0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    
    func setupCell(backgroundImage: String, profileImage: String, backgroundColor: String, title: String, album: String, year: String) {
        self.profileImageView.image  = UIImage(named: profileImage)
        self.backgroundImageView.image  = UIImage(named: backgroundImage)
        self.cellBackground.backgroundColor = backgroundColor.hexColor
        self.mainTitleLbl.text = title
        self.albumTitle.text = album
        self.albumYearLbl.text  = year        
    }
    
    func setupView() {
        
        self.cellBackground.layer.borderWidth = 0.0
        self.cellBackground.layer.borderColor = UIColor.clear.cgColor
        self.cellBackground.layer.cornerRadius = 10
        self.cellBackground.layer.masksToBounds = false
        
        self.selectionStyle = .none
        
    }
    
    
    
}
