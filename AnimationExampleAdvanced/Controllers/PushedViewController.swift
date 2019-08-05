import UIKit


class PushedViewController: UIViewController {
    
    // ImageViews
    @IBOutlet weak var profileIV: UIImageView!
    @IBOutlet weak var plusIV: UIImageView!
    @IBOutlet weak var playIV: UIImageView!
    @IBOutlet weak var likeIV: UIImageView!
    @IBOutlet weak var cancelIV: UIImageView!
    @IBOutlet weak var backgroundIV: UIImageView!

    // Views
    @IBOutlet weak var topBackground: UIView!
    @IBOutlet weak var bottomBackground: UIView!
    
    // Labels
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    
    // Vars
    var selectedProfileImage: String?
    var selectedBackgroundImage: String?
    var mainTitle: String?
    var album: String?
    var year: String?
    var topHexColor: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let topColor = topHexColor {
            topBackground.backgroundColor =  topColor.hexColor
        }
        
        // Setup Profile Image
        if let imageProfile = selectedProfileImage {
            profileIV.image  = UIImage(named: imageProfile)
        }

        // Setup Profile Image
        if let imageBackground = selectedBackgroundImage {
            backgroundIV.image  = UIImage(named: imageBackground)
        }
        // Setup Title
        if let selectedTitle = mainTitle {
            self.titleLbl.text = selectedTitle
        }
        // Setup Album
        if let selectedAlbum = album {
            self.albumLabel.text = selectedAlbum
        }
        // Setup Year
        if let selectedYear = year {
            self.yearLabel.text = selectedYear
        }
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        self.view.addGestureRecognizer(tap)
        
    }
    
    @objc func doubleTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}

extension PushedViewController : animTransitionable
{
    var profileImageView: UIImageView {
        return profileIV
    }
    
    var backgroundImageView: UIImageView {
        return backgroundIV
    }
    
    var plusImageView: UIImageView {
        return plusIV
    }
    
    var playImageView: UIImageView {
        return playIV
    }
    
    var likeImageView: UIImageView {
        return likeIV
    }
    
    var cancelImageView: UIImageView {
        return cancelIV
    }
    
    var backgroundColor: UIView {
        return topBackground
    }
    
    var cellBackground: UIView {
        return bottomBackground
    }
    
    var bigTitle: UILabel {
        return titleLbl
    }
    
    var albumLbl: UILabel {
        return albumLabel
    }
    
    var yearLbl: UILabel {
        return yearLabel
    }
    
}

