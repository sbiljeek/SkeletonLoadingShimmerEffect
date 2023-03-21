//
//  MyCell.swift
//  SkeletonLoadingShimmerEffect
//
//  Created by Salman Biljeek on 3/12/23.
//

import UIKit

class MyCell: UICollectionViewCell {
    
    let captionLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 14, weight: .heavy)
        label.textColor = .label
        label.textAlignment = .left
        label.numberOfLines = 3
        return label
    }()
    let profileImageHeight: CGFloat = 20
    let profilePlaceholderImage = UIImage(systemName: "person.crop.circle")?.withRenderingMode(.alwaysOriginal).withTintColor(.label)
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView(image: profilePlaceholderImage)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: profileImageHeight).isActive = true
        let heightConstraint = imageView.heightAnchor.constraint(equalToConstant: profileImageHeight)
        heightConstraint.priority = UILayoutPriority(990)
        heightConstraint.isActive = true
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = profileImageHeight / 2
        imageView.layer.borderWidth = 1
        return imageView
    }()
    let usernamelLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 13)
        label.textColor = .label
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    let imageHeight: CGFloat = 70
    let imageCornerRadius: CGFloat = 14
    lazy var imageView: UIImageView = {
        let image = UIImage(named: "photo_square_fill_flat")?.withRenderingMode(.alwaysOriginal).withTintColor(.tertiaryLabel)
        let imageView = UIImageView(image: image)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = imageCornerRadius
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderWidth = 1
        imageView.accessibilityIgnoresInvertColors = true
        imageView.widthAnchor.constraint(equalToConstant: imageHeight).isActive = true
        let heightConstraint = imageView.heightAnchor.constraint(equalToConstant: imageHeight)
        heightConstraint.isActive = true
        heightConstraint.priority = UILayoutPriority(990)
        return imageView
    }()
    let timestampLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 13)
        label.textColor = .label
        label.textAlignment = .right
        label.numberOfLines = 1
        return label
    }()
    let skeletonView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    let gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.locations = [0, 0.5, 1]
        let angle = 45 * CGFloat.pi / 180
        gradientLayer.transform = CATransform3DMakeRotation(angle, 0, 0, 1)
        return gradientLayer
    }()
    let animation = CABasicAnimation(keyPath: "transform.translation.x")
    var cellBackgroundColor: UIColor = .systemBackground
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = self.cellBackgroundColor
        isUserInteractionEnabled = false
        
        let usernameStack = UIStackView(arrangedSubviews: [
            usernamelLabel,
            UIView()
        ])
        usernameStack.axis = .horizontal
        usernameStack.spacing = 3
        usernameStack.alignment = .center
        
        let ProfileImageStack = UIStackView(arrangedSubviews: [
            profileImageView,
            usernameStack
        ])
        ProfileImageStack.axis = .horizontal
        ProfileImageStack.spacing = 5
        
        let leftStack = UIStackView(arrangedSubviews: [
            captionLabel,
            UIView(),
            ProfileImageStack
        ])
        leftStack.axis = .vertical
        leftStack.isLayoutMarginsRelativeArrangement = true
        leftStack.layoutMargins = .init(top: 5, left: 0, bottom: 5, right: 0)
        
        let timestampStack = UIStackView(arrangedSubviews: [
            timestampLabel
        ])
        timestampStack.isLayoutMarginsRelativeArrangement = true
        timestampStack.layoutMargins = .init(top: 0, left: 0, bottom: 0, right: 6)
        
        let rightStack = UIStackView(arrangedSubviews: [
            imageView,
            timestampStack
        ])
        rightStack.axis = .vertical
        rightStack.spacing = 5
        
        let contentViewStack = UIStackView(arrangedSubviews: [
            leftStack,
            UIView(),
            rightStack
        ])
        contentViewStack.axis = .horizontal
        contentViewStack.spacing = 6
        
        let leftRightPadding: CGFloat = 12
        let topBottomPadding: CGFloat = 10
        
        contentViewStack.isLayoutMarginsRelativeArrangement = true
        contentViewStack.layoutMargins = .init(top: topBottomPadding, left: leftRightPadding, bottom: topBottomPadding, right: leftRightPadding)
        
        contentView.addSubview(contentViewStack)
        contentViewStack.translatesAutoresizingMaskIntoConstraints = false
        contentViewStack.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        contentViewStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        contentViewStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        contentViewStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        let skeletonTextHeight: CGFloat = 12
        
        let skeletonStackView: UIStackView = {
            let skeletonColor: UIColor = .systemFill
            
            let skeletonLeftStack: UIStackView = {
                let skeletonCaptionStack1: UIStackView = {
                    let view: UIView = {
                        let view = UIView()
                        view.backgroundColor = skeletonColor
                        view.layer.cornerRadius = 4
                        view.translatesAutoresizingMaskIntoConstraints = false
                        view.widthAnchor.constraint(equalToConstant: 190).isActive = true
                        view.heightAnchor.constraint(equalToConstant: skeletonTextHeight).isActive = true
                        return view
                    }()
                    let stackView = UIStackView(arrangedSubviews: [
                        view,
                        UIView()
                    ])
                    stackView.axis = .horizontal
                    return stackView
                }()
                let skeletonCaptionStack2: UIStackView = {
                    let view: UIView = {
                        let view = UIView()
                        view.backgroundColor = skeletonColor
                        view.layer.cornerRadius = 4
                        view.translatesAutoresizingMaskIntoConstraints = false
                        view.widthAnchor.constraint(equalToConstant: 150).isActive = true
                        view.heightAnchor.constraint(equalToConstant: skeletonTextHeight).isActive = true
                        return view
                    }()
                    let stackView = UIStackView(arrangedSubviews: [
                        view,
                        UIView()
                    ])
                    stackView.axis = .horizontal
                    return stackView
                }()
                let skeletonCaptionStack3: UIStackView = {
                    let view: UIView = {
                        let view = UIView()
                        view.backgroundColor = skeletonColor
                        view.layer.cornerRadius = 4
                        view.translatesAutoresizingMaskIntoConstraints = false
                        view.widthAnchor.constraint(equalToConstant: 60).isActive = true
                        view.heightAnchor.constraint(equalToConstant: skeletonTextHeight).isActive = true
                        return view
                    }()
                    let stackView = UIStackView(arrangedSubviews: [
                        view,
                        UIView()
                    ])
                    stackView.axis = .horizontal
                    return stackView
                }()
                let skeletonUsernameStack: UIStackView = {
                    let profileImageView: UIView = {
                        let view = UIView()
                        view.backgroundColor = skeletonColor
                        view.layer.cornerRadius = profileImageHeight / 2
                        view.translatesAutoresizingMaskIntoConstraints = false
                        view.widthAnchor.constraint(equalToConstant: profileImageHeight).isActive = true
                        let heightConstraint = view.heightAnchor.constraint(equalToConstant: profileImageHeight)
                        heightConstraint.priority = UILayoutPriority(990)
                        heightConstraint.isActive = true
                        return view
                    }()
                    let usernameView: UIView = {
                        let view = UIView()
                        view.backgroundColor = skeletonColor
                        view.layer.cornerRadius = 4
                        view.translatesAutoresizingMaskIntoConstraints = false
                        view.widthAnchor.constraint(equalToConstant: 65).isActive = true
                        view.heightAnchor.constraint(equalToConstant: 10).isActive = true
                        return view
                    }()
                    let stackView = UIStackView(arrangedSubviews: [
                        profileImageView,
                        usernameView,
                        UIView()
                    ])
                    stackView.axis = .horizontal
                    stackView.spacing = 5
                    stackView.alignment = .center
                    return stackView
                }()
                let stackView = UIStackView(arrangedSubviews: [
                    skeletonCaptionStack1,
                    skeletonCaptionStack2,
                    skeletonCaptionStack3,
                    UIView(),
                    skeletonUsernameStack
                ])
                stackView.axis = .vertical
                stackView.spacing = 4
                return stackView
            }()
            
            let skeletonRightStack: UIStackView = {
                let skeletonPostImageView: UIView = {
                    let view = UIView()
                    view.backgroundColor = skeletonColor
                    view.layer.cornerRadius = imageCornerRadius
                    view.translatesAutoresizingMaskIntoConstraints = false
                    view.widthAnchor.constraint(equalToConstant: imageHeight).isActive = true
                    let heightConstraint = view.heightAnchor.constraint(equalToConstant: imageHeight)
                    heightConstraint.isActive = true
                    heightConstraint.priority = UILayoutPriority(990)
                    return view
                }()
                let stackView = UIStackView(arrangedSubviews: [
                    skeletonPostImageView,
                    UIView()
                ])
                stackView.axis = .vertical
                return stackView
            }()
            
            let stackView = UIStackView(arrangedSubviews: [
                skeletonLeftStack,
                UIView(),
                skeletonRightStack
            ])
            stackView.axis = .horizontal
            stackView.spacing = 6
            stackView.isLayoutMarginsRelativeArrangement = true
            stackView.layoutMargins = .init(top: topBottomPadding, left: leftRightPadding, bottom: topBottomPadding, right: leftRightPadding)
            return stackView
        }()
        
        let skeletonMaskStackView: UIStackView = {
            let skeletonColor: UIColor = .secondarySystemFill
            
            let skeletonLeftStack: UIStackView = {
                let skeletonCaptionStack1: UIStackView = {
                    let view: UIView = {
                        let view = UIView()
                        view.backgroundColor = skeletonColor
                        view.layer.cornerRadius = 4
                        view.translatesAutoresizingMaskIntoConstraints = false
                        view.widthAnchor.constraint(equalToConstant: 190).isActive = true
                        view.heightAnchor.constraint(equalToConstant: skeletonTextHeight).isActive = true
                        return view
                    }()
                    let stackView = UIStackView(arrangedSubviews: [
                        view,
                        UIView()
                    ])
                    stackView.axis = .horizontal
                    return stackView
                }()
                let skeletonCaptionStack2: UIStackView = {
                    let view: UIView = {
                        let view = UIView()
                        view.backgroundColor = skeletonColor
                        view.layer.cornerRadius = 4
                        view.translatesAutoresizingMaskIntoConstraints = false
                        view.widthAnchor.constraint(equalToConstant: 150).isActive = true
                        view.heightAnchor.constraint(equalToConstant: skeletonTextHeight).isActive = true
                        return view
                    }()
                    let stackView = UIStackView(arrangedSubviews: [
                        view,
                        UIView()
                    ])
                    stackView.axis = .horizontal
                    return stackView
                }()
                let skeletonCaptionStack3: UIStackView = {
                    let view: UIView = {
                        let view = UIView()
                        view.backgroundColor = skeletonColor
                        view.layer.cornerRadius = 4
                        view.translatesAutoresizingMaskIntoConstraints = false
                        view.widthAnchor.constraint(equalToConstant: 60).isActive = true
                        view.heightAnchor.constraint(equalToConstant: skeletonTextHeight).isActive = true
                        return view
                    }()
                    let stackView = UIStackView(arrangedSubviews: [
                        view,
                        UIView()
                    ])
                    stackView.axis = .horizontal
                    return stackView
                }()
                let skeletonUsernameStack: UIStackView = {
                    let profileImageView: UIView = {
                        let view = UIView()
                        view.backgroundColor = skeletonColor
                        view.layer.cornerRadius = profileImageHeight / 2
                        view.translatesAutoresizingMaskIntoConstraints = false
                        view.widthAnchor.constraint(equalToConstant: profileImageHeight).isActive = true
                        let heightConstraint = view.heightAnchor.constraint(equalToConstant: profileImageHeight)
                        heightConstraint.priority = UILayoutPriority(990)
                        heightConstraint.isActive = true
                        return view
                    }()
                    let usernameView: UIView = {
                        let view = UIView()
                        view.backgroundColor = skeletonColor
                        view.layer.cornerRadius = 4
                        view.translatesAutoresizingMaskIntoConstraints = false
                        view.widthAnchor.constraint(equalToConstant: 65).isActive = true
                        view.heightAnchor.constraint(equalToConstant: 10).isActive = true
                        return view
                    }()
                    let stackView = UIStackView(arrangedSubviews: [
                        profileImageView,
                        usernameView,
                        UIView()
                    ])
                    stackView.axis = .horizontal
                    stackView.spacing = 5
                    stackView.alignment = .center
                    return stackView
                }()
                let stackView = UIStackView(arrangedSubviews: [
                    skeletonCaptionStack1,
                    skeletonCaptionStack2,
                    skeletonCaptionStack3,
                    UIView(),
                    skeletonUsernameStack
                ])
                stackView.axis = .vertical
                stackView.spacing = 4
                return stackView
            }()
            
            let skeletonRightStack: UIStackView = {
                let skeletonPostImageView: UIView = {
                    let view = UIView()
                    view.backgroundColor = skeletonColor
                    view.layer.cornerRadius = imageCornerRadius
                    view.translatesAutoresizingMaskIntoConstraints = false
                    view.widthAnchor.constraint(equalToConstant: imageHeight).isActive = true
                    let heightConstraint = view.heightAnchor.constraint(equalToConstant: imageHeight)
                    heightConstraint.isActive = true
                    heightConstraint.priority = UILayoutPriority(990)
                    return view
                }()
                let stackView = UIStackView(arrangedSubviews: [
                    skeletonPostImageView,
                    UIView()
                ])
                stackView.axis = .vertical
                return stackView
            }()
            
            let stackView = UIStackView(arrangedSubviews: [
                skeletonLeftStack,
                UIView(),
                skeletonRightStack
            ])
            stackView.axis = .horizontal
            stackView.spacing = 6
            stackView.isLayoutMarginsRelativeArrangement = true
            stackView.layoutMargins = .init(top: topBottomPadding, left: leftRightPadding, bottom: topBottomPadding, right: leftRightPadding)
            return stackView
        }()
        
        skeletonView.addSubview(skeletonStackView)
        skeletonStackView.translatesAutoresizingMaskIntoConstraints = false
        skeletonStackView.topAnchor.constraint(equalTo: skeletonView.topAnchor).isActive = true
        skeletonStackView.leadingAnchor.constraint(equalTo: skeletonView.leadingAnchor).isActive = true
        skeletonStackView.bottomAnchor.constraint(equalTo: skeletonView.bottomAnchor).isActive = true
        skeletonStackView.trailingAnchor.constraint(equalTo: skeletonView.trailingAnchor).isActive = true
        
        skeletonView.addSubview(skeletonMaskStackView)
        skeletonMaskStackView.translatesAutoresizingMaskIntoConstraints = false
        skeletonMaskStackView.topAnchor.constraint(equalTo: skeletonView.topAnchor).isActive = true
        skeletonMaskStackView.leadingAnchor.constraint(equalTo: skeletonView.leadingAnchor).isActive = true
        skeletonMaskStackView.bottomAnchor.constraint(equalTo: skeletonView.bottomAnchor).isActive = true
        skeletonMaskStackView.trailingAnchor.constraint(equalTo: skeletonView.trailingAnchor).isActive = true
        
        skeletonMaskStackView.layer.mask = gradientLayer
        
        contentViewStack.addSubview(skeletonView)
        skeletonView.translatesAutoresizingMaskIntoConstraints = false
        skeletonView.topAnchor.constraint(equalTo: contentViewStack.topAnchor).isActive = true
        skeletonView.leadingAnchor.constraint(equalTo: contentViewStack.leadingAnchor).isActive = true
        skeletonView.bottomAnchor.constraint(equalTo: contentViewStack.bottomAnchor).isActive = true
        skeletonView.trailingAnchor.constraint(equalTo: contentViewStack.trailingAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.cellBackgroundColor = self.traitCollection.userInterfaceStyle == .dark ? .secondarySystemBackground : .systemBackground
        self.contentView.backgroundColor = self.cellBackgroundColor
        
        profileImageView.layer.borderColor = UIColor.quaternaryLabel.cgColor
        imageView.layer.borderColor = UIColor.quaternaryLabel.cgColor
        
        gradientLayer.frame = bounds
        animation.fromValue = -frame.width
        animation.toValue = frame.width
        animation.duration = 2
        animation.repeatCount = Float.infinity
        gradientLayer.removeAnimation(forKey: "skeletonAnimation")
        gradientLayer.add(animation, forKey: "skeletonAnimation")
        gradientLayer.colors = [UIColor.white.withAlphaComponent(0).cgColor, UIColor.white.cgColor, UIColor.white.withAlphaComponent(0).cgColor]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


