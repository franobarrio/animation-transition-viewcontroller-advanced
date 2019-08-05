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

// MARK: - Protocol for Transition
extension MainViewController : animTransitionable
{
    
    // Profile Image
    var profileImageView: UIImageView {
        if let indexPath = selectedIndexPath {
            let cell = tableView?.cellForRow(at: indexPath) as! MainTableViewCell
            return cell.profileImageView
        }
        return UIImageView()
    }
    
    // Background Image
    var backgroundImageView: UIImageView {
        if let indexPath = selectedIndexPath {
            let cell = tableView?.cellForRow(at: indexPath) as! MainTableViewCell
            return cell.backgroundImageView
        }
        return UIImageView()
    }
    
    
    // Plus Button
    var plusImageView: UIImageView {
        if let indexPath = selectedIndexPath {
            let cell = tableView?.cellForRow(at: indexPath) as! MainTableViewCell
            return cell.plusImageView
        }
        return UIImageView()
    }
    
    // Play Button
    var playImageView: UIImageView {
        if let indexPath = selectedIndexPath {
            let cell = tableView?.cellForRow(at: indexPath) as! MainTableViewCell
            return cell.playImageView
        }
        return UIImageView()
    }
    
    // Like Button
    var likeImageView: UIImageView {
        if let indexPath = selectedIndexPath {
            let cell = tableView?.cellForRow(at: indexPath) as! MainTableViewCell
            return cell.likeImageView
        }
        return UIImageView()
    }
    
    // Cancel Button
    var cancelImageView: UIImageView {
        if let indexPath = selectedIndexPath {
            let cell = tableView?.cellForRow(at: indexPath) as! MainTableViewCell
            return cell.cancelImageView
        }
        return UIImageView()
    }
    
    
    
    // Background Color
    var backgroundColor: UIView {
        return backgroundView
    }
    
    // Cell Background
    var cellBackground: UIView {
        if let indexPath = selectedIndexPath {
            let cell = tableView?.cellForRow(at: indexPath) as! MainTableViewCell
            return cell.cellBackground
        }
        return UIView()
    }
    
    // Labels
    var bigTitle: UILabel {
        if let indexPath = selectedIndexPath {
            let cell = tableView?.cellForRow(at: indexPath) as! MainTableViewCell
            return cell.mainTitleLbl
        }
        return UILabel()
    }
    var albumLbl: UILabel {
        if let indexPath = selectedIndexPath {
            let cell = tableView?.cellForRow(at: indexPath) as! MainTableViewCell
            return cell.albumTitle
        }
        return UILabel()
    }
    var yearLbl: UILabel {
        if let indexPath = selectedIndexPath {
            let cell = tableView?.cellForRow(at: indexPath) as! MainTableViewCell
            return cell.albumYearLbl
        }
        return UILabel()
    }
    
    
    
    
    
}





