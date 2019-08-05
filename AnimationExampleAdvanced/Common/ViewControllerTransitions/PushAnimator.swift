import UIKit
import QuartzCore


class PushAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    var duration : TimeInterval
    
    init(duration : TimeInterval) {
        self.duration = duration
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView
        
        
        guard let fromVC = transitionContext.viewController(forKey: .from) as? animTransitionable,
            let toVC = transitionContext.viewController(forKey: .to) as? animTransitionable else {
                transitionContext.completeTransition(false)
                return
        }
        
        
        
        
        let fromViewController = transitionContext.viewController(forKey: .from)!
        let toViewController = transitionContext.viewController(forKey: .to)!
        
        // Plus Image
        let imageViewSnapshotPlus = UIImageView(image: fromVC.plusImageView.image)
        imageViewSnapshotPlus.contentMode = .scaleAspectFit
        
        //Profile Image
        let imageViewSnapshotProfile = UIImageView(image: fromVC.profileImageView.image)
        imageViewSnapshotProfile.contentMode = .scaleAspectFit
        
        //Background Image
        let imageViewSnapshotBackground = UIImageView(image: fromVC.backgroundImageView.image)
        imageViewSnapshotBackground.contentMode = .scaleAspectFit
        
        
        //Like Image
        let imageViewSnapshotLike = UIImageView(image: fromVC.likeImageView.image)
        imageViewSnapshotLike.contentMode = .scaleAspectFit
        
        //Play Image
        let imageViewSnapshotPlay = UIImageView(image: fromVC.playImageView.image)
        imageViewSnapshotPlay.contentMode = .scaleAspectFit
        
        //Cancel Image
        let imageViewSnapshotCancel = UIImageView(image: fromVC.cancelImageView.image)
        imageViewSnapshotCancel.contentMode = .scaleAspectFit
        
        
        
        //Background View With Correct Color
        let backgroundView = UIView()
        backgroundView.frame = fromVC.backgroundColor.frame
        backgroundView.backgroundColor = UIColor.white
        containerView.addSubview(backgroundView)
        
        
        // Title
        let titleLabel = duplicateLabel(label: fromVC.bigTitle)
        titleLabel.text = fromVC.bigTitle.text
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.frame = containerView.convert(fromVC.bigTitle.frame, from: fromVC.bigTitle.superview)
        
        // Album
        let albumLabel = duplicateLabel(label: fromVC.albumLbl)
        albumLabel.text = fromVC.albumLbl.text
        albumLabel.backgroundColor = UIColor.clear
        albumLabel.frame = containerView.convert(fromVC.albumLbl.frame, from: fromVC.albumLbl.superview)
        
        
        // Year
        let yearLabel = duplicateLabel(label: fromVC.yearLbl)
        yearLabel.text = fromVC.yearLbl.text
        yearLabel.backgroundColor = UIColor.clear
        yearLabel.frame = containerView.convert(fromVC.yearLbl.frame, from: fromVC.yearLbl.superview)
        
        
        
        
        // Cell Background
        let cellBackground = UIView()
        cellBackground.frame =  containerView.convert(fromVC.cellBackground.frame, from: fromVC.cellBackground.superview)
        cellBackground.backgroundColor = fromVC.cellBackground.backgroundColor
        cellBackground.layer.cornerRadius = fromVC.cellBackground.layer.cornerRadius
        cellBackground.layer.masksToBounds = fromVC.cellBackground.layer.masksToBounds
        
        
        containerView.addSubview(fromViewController.view)
        containerView.addSubview(toViewController.view)

        // Background Cell
        containerView.addSubview(cellBackground)
        
        // Top
        containerView.addSubview(imageViewSnapshotProfile)
        containerView.addSubview(imageViewSnapshotBackground)
        containerView.addSubview(imageViewSnapshotPlus)
        
        // Down
        containerView.addSubview(imageViewSnapshotPlay)
        containerView.addSubview(imageViewSnapshotCancel)
        containerView.addSubview(imageViewSnapshotLike)
        
        
        // Title Label
        containerView.addSubview(titleLabel)
        containerView.addSubview(albumLabel)
        containerView.addSubview(yearLabel)
        
        containerView.bringSubview(toFront: imageViewSnapshotPlus)
        
        
        fromViewController.view.isHidden = true
        toViewController.view.isHidden = true
        
        // TOP
        imageViewSnapshotPlus.frame = containerView.convert(fromVC.plusImageView.frame, from: fromVC.plusImageView.superview)
        imageViewSnapshotProfile.frame = containerView.convert(fromVC.profileImageView.frame, from: fromVC.profileImageView.superview)
        imageViewSnapshotBackground.frame = containerView.convert(fromVC.backgroundImageView.frame, from: fromVC.backgroundImageView.superview)
        
        
        // BOTTOM
        imageViewSnapshotCancel.frame = containerView.convert(fromVC.cancelImageView.frame, from: fromVC.cancelImageView.superview)
        imageViewSnapshotPlay.frame = containerView.convert(fromVC.playImageView.frame, from: fromVC.playImageView.superview)
        imageViewSnapshotLike.frame = containerView.convert(fromVC.likeImageView.frame, from: fromVC.likeImageView.superview)
        
        
        
        
        let frameBackground: CGRect =  containerView.convert(toVC.backgroundColor.frame, from: toVC.backgroundColor.superview)
        
        // TOP
        let frameProfile: CGRect = containerView.convert(toVC.profileImageView.frame, from: toVC.profileImageView.superview)
        let frameBackgroundImage: CGRect = containerView.convert(toVC.backgroundImageView.frame, from: toVC.backgroundImageView.superview)
        let framePlus: CGRect = containerView.convert(toVC.plusImageView.frame, from: toVC.plusImageView.superview)
        
        // BOTTOM
        let framePlay: CGRect = containerView.convert(toVC.playImageView.frame, from: toVC.playImageView.superview)
        
        
        // Animators
        let animator1 = {
            UIViewPropertyAnimator(duration: 0.5, dampingRatio: 0.8) {
                
                // HAY QUE PONER BIEN LOS TAMAÑOS DE LAS IMAGENES
                let backgroundX = cellBackground.frame.minX + (cellBackground.frame.width * 5 / 100)
                let backgroundWidth = cellBackground.frame.width - (cellBackground.frame.width * 10 / 100)
                
                
                // BACKGROUND
                cellBackground.frame = CGRect(x: backgroundX , y: cellBackground.frame.minY + (cellBackground.frame.minY * 5 / 100), width: backgroundWidth, height: cellBackground.frame.height - (cellBackground.frame.height * 10 / 100))
                
                // LABEL
                titleLabel.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                titleLabel.frame = CGRect(x: titleLabel.frame.minX , y: titleLabel.frame.minY + 15, width: titleLabel.frame.width, height: titleLabel.frame.height)
                

                
                
                // TOP
                imageViewSnapshotPlus.frame = CGRect(x: cellBackground.frame.maxX - (imageViewSnapshotPlus.frame.width * 20 / 100) - 40  , y: cellBackground.frame.minY + (imageViewSnapshotPlus.frame.height * 20 / 100) + 10, width: imageViewSnapshotPlus.frame.width - (imageViewSnapshotPlus.frame.width * 20 / 100), height: imageViewSnapshotPlus.frame.height - (imageViewSnapshotPlus.frame.height * 20 / 100))
                
                
                imageViewSnapshotProfile.frame = CGRect(x: cellBackground.frame.minX - (imageViewSnapshotProfile.frame.width * 20 / 100) + 30  , y: cellBackground.frame.minY + (imageViewSnapshotProfile.frame.height * 20 / 100) + 10, width: imageViewSnapshotProfile.frame.width - (imageViewSnapshotProfile.frame.width * 20 / 100), height: imageViewSnapshotProfile.frame.height - (imageViewSnapshotProfile.frame.height * 20 / 100))
                
                // LAbels
                albumLabel.frame = CGRect(x: imageViewSnapshotProfile.frame.maxX + 15 , y: imageViewSnapshotProfile.frame.minY + 3, width: albumLabel.frame.width, height: albumLabel.frame.height)
                albumLabel.sizeToFit()

                yearLabel.frame = CGRect(x: imageViewSnapshotProfile.frame.maxX + 15 , y: imageViewSnapshotProfile.frame.minY + 23, width: yearLabel.frame.width, height: yearLabel.frame.height)
                yearLabel.sizeToFit()
                
                
                // Image Background
                let widthBackground = (imageViewSnapshotBackground.frame.width - (imageViewSnapshotBackground.frame.width * 20 / 100) )
                let heightBackground = (imageViewSnapshotBackground.frame.height - (imageViewSnapshotBackground.frame.height * 20 / 100) )
                let midPostionPlayButton = imageViewSnapshotPlay.frame.width - (imageViewSnapshotPlay.frame.width * 20 / 100)
                
                imageViewSnapshotBackground.frame = CGRect(x:  cellBackground.frame.midX - (widthBackground / 2) , y: cellBackground.frame.maxY - (heightBackground)  , width: widthBackground, height: imageViewSnapshotBackground.frame.height - (imageViewSnapshotBackground.frame.height * 20 / 100))
                
                
                
                imageViewSnapshotPlay.frame = CGRect(x:  cellBackground.frame.midX - (midPostionPlayButton / 2), y: cellBackground.frame.maxY  - imageViewSnapshotPlay.frame.height - 10, width: imageViewSnapshotPlay.frame.width - (imageViewSnapshotPlay.frame.width * 20 / 100), height: imageViewSnapshotPlay.frame.width - (imageViewSnapshotPlay.frame.width * 20 / 100))
                
                
                
                imageViewSnapshotCancel.frame = CGRect(x: cellBackground.frame.midX - (midPostionPlayButton / 2) - imageViewSnapshotCancel.frame.width - 30, y: cellBackground.frame.maxY - (imageViewSnapshotCancel.frame.height * 2), width: imageViewSnapshotCancel.frame.width - (imageViewSnapshotCancel.frame.width * 20 / 100), height: imageViewSnapshotCancel.frame.height - (imageViewSnapshotCancel.frame.height * 20 / 100))
                
                imageViewSnapshotLike.frame = CGRect(x: cellBackground.frame.midX + (midPostionPlayButton / 2)  + (imageViewSnapshotLike.frame.width * 20 / 100) + 30, y: cellBackground.frame.maxY - (imageViewSnapshotLike.frame.height * 2) , width: imageViewSnapshotLike.frame.width - (imageViewSnapshotLike.frame.width * 20 / 100), height: imageViewSnapshotLike.frame.height - (imageViewSnapshotLike.frame.height * 20 / 100))
                
                
                
            }
        }()
        
        // Animators
        let animator2 = {
            //UIViewPropertyAnimator(duration: 0.5, dampingRatio: 0.6) {
            UIViewPropertyAnimator(duration: 0.3, curve: .easeOut) {
                
                cellBackground.frame = CGRect(x: frameBackground.minX , y: frameBackground.minY, width: UIScreen.main.bounds.width, height: frameBackground.height)
                cellBackground.layer.cornerRadius = 0
                
                // Label
                titleLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                titleLabel.frame = containerView.convert(toVC.bigTitle.frame, from: toVC.bigTitle.superview)
                
                albumLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                albumLabel.frame = containerView.convert(toVC.albumLbl.frame, from: toVC.albumLbl.superview)
                albumLabel.textAlignment = .center
                
                yearLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                yearLabel.frame = containerView.convert(toVC.yearLbl.frame, from: toVC.yearLbl.superview)
                yearLabel.textAlignment = .center
                
                
                imageViewSnapshotCancel.frame = containerView.convert(toVC.cancelImageView.frame, from: toVC.cancelImageView.superview)
                imageViewSnapshotPlay.frame = containerView.convert(toVC.playImageView.frame, from: toVC.playImageView.superview)
                imageViewSnapshotLike.frame = containerView.convert(toVC.likeImageView.frame, from: toVC.likeImageView.superview)
                
                imageViewSnapshotBackground.frame = containerView.convert(toVC.backgroundImageView.frame, from: toVC.backgroundImageView.superview)
                
                
                cellBackground.layoutIfNeeded()
                
            }
        }()
        
        
        
        animator1.addCompletion { _ in
            animator2.startAnimation()
            
            // Group Animator
            doBezierAnimation(showLayerAnimation: false)
            
        }
        
        
        animator2.addCompletion {  _ in
            
            // Background
            cellBackground.removeFromSuperview()
            
            // Labels
            titleLabel.removeFromSuperview()
            albumLabel.removeFromSuperview()
            yearLabel.removeFromSuperview()
            
            // TOP
            imageViewSnapshotProfile.removeFromSuperview()
            imageViewSnapshotPlus.removeFromSuperview()
            imageViewSnapshotBackground.removeFromSuperview()
            
            // BOTTOM
            imageViewSnapshotCancel.removeFromSuperview()
            imageViewSnapshotPlay.removeFromSuperview()
            imageViewSnapshotLike.removeFromSuperview()
            
            fromViewController.view.removeFromSuperview()
            
            toViewController.view.isHidden = false
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            
            
        }
        
        
        
        animator1.startAnimation()
        
        
        
        func doBezierAnimation(showLayerAnimation: Bool = false) {
            
            
            //*** PROFILE IMAGE ***//
            
            // Profile Animation
            var bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: imageViewSnapshotProfile.frame.midX, y: imageViewSnapshotProfile.frame.midY))
            bezierPath.addQuadCurve(to: CGPoint(x: UIScreen.main.bounds.width / 2 , y: frameProfile.midY), controlPoint: CGPoint(x: frameProfile.midX/2, y: frameProfile.midY/2))
            
            
            var shapeLayer = CAShapeLayer()            
            // The Bezier path that we made needs to be converted to a CGPath before it can be used on a layer.
            shapeLayer.path = bezierPath.cgPath
            shapeLayer.strokeColor = UIColor.blue.cgColor
            shapeLayer.fillColor = UIColor.clear.cgColor
            shapeLayer.lineWidth = 1.0
            
            // Enable/Disable for debug
            if showLayerAnimation {
                containerView.layer.addSublayer(shapeLayer)
            }
            
            let profileAnimationPosition = CAKeyframeAnimation(keyPath: "position")
            profileAnimationPosition.path = bezierPath.cgPath
            // I set this one to make the animation go smoothly along the path
            profileAnimationPosition.calculationMode = kCAAnimationPaced
            profileAnimationPosition.duration = 0.3
            profileAnimationPosition.timingFunction  = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
            
            
            let profileAnimationBounds = CAKeyframeAnimation(keyPath: "bounds")
            profileAnimationBounds.duration = 0.3
            profileAnimationBounds.values = [imageViewSnapshotProfile.frame, containerView.convert(toVC.profileImageView.frame, from: toVC.profileImageView.superview)]
            profileAnimationBounds.timingFunction  = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
            profileAnimationBounds.beginTime = 0
            
            // Let's group the animation for position and bounds into one
            let groupProfile = CAAnimationGroup()
            groupProfile.animations = [profileAnimationPosition, profileAnimationBounds]
            groupProfile.duration = 0.3
            groupProfile.repeatCount = 0
            groupProfile.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
            groupProfile.isRemovedOnCompletion = false
            groupProfile.fillMode = kCAFillModeForwards
            
            imageViewSnapshotProfile.layer.add(groupProfile, forKey: "profileAnimation")
            
            
            //*** PLUS IMAGE ***//
            
            // Plus ImageView Animation
            bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: imageViewSnapshotPlus.frame.maxX, y: imageViewSnapshotPlus.frame.maxY))
            bezierPath.addQuadCurve(to: CGPoint(x: (UIScreen.main.bounds.width / 2) + 20, y: framePlus.maxY - 10), controlPoint: CGPoint(x:framePlus.maxX + 30, y: framePlus.maxY/4))
            
            
            shapeLayer = CAShapeLayer()
            
            // The Bezier path that we made needs to be converted to
            shapeLayer.path = bezierPath.cgPath
            shapeLayer.strokeColor = UIColor.blue.cgColor
            shapeLayer.fillColor = UIColor.clear.cgColor
            shapeLayer.lineWidth = 1.0
            
            // Enable/Disable for debug
            if showLayerAnimation {
                containerView.layer.addSublayer(shapeLayer)
            }
            
            
            
            let plusAnimationPosition = CAKeyframeAnimation(keyPath: "position")
            plusAnimationPosition.path = bezierPath.cgPath
            // I set this one to make the animation go smoothly along the path
            plusAnimationPosition.calculationMode = kCAAnimationPaced
            plusAnimationPosition.duration = 0.3
            plusAnimationPosition.rotationMode = kCAAnimationLinear
            plusAnimationPosition.timingFunction  = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
            
            
            let plusAnimationBounds = CAKeyframeAnimation(keyPath: "bounds")
            plusAnimationBounds.duration = 0.3
            plusAnimationBounds.values = [imageViewSnapshotPlus.frame, containerView.convert(toVC.plusImageView.frame, from: toVC.plusImageView.superview)]
            plusAnimationBounds.timingFunction  = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
            plusAnimationBounds.beginTime = 0
            
            // Let's group the animation for position and bounds into one
            let groupPlus = CAAnimationGroup()
            groupPlus.animations = [plusAnimationPosition, plusAnimationBounds]
            groupPlus.duration = 0.3
            groupPlus.repeatCount = 0
            groupPlus.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
            groupPlus.isRemovedOnCompletion = false
            groupPlus.fillMode = kCAFillModeForwards
            
            imageViewSnapshotPlus.layer.add(groupPlus, forKey: "doit")
            
            
        }
        
    }
    
    
    
}


