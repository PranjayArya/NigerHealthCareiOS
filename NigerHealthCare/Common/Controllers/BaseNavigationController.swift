//
//  BaseNavigationController.swift
//  Reach
//
//  Created by Abhayam Rastogi on 14/06/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import UIKit

protocol NavigationControllerChild {
    func preferredColorScheme() -> Theme
    func prefersNavigationBarHidden() -> Bool
}

extension NavigationControllerChild {
    func setNeedsColorSchemeUpdate() {
        guard let viewController = self as? UIViewController else {
            return
        }
        let navigationController = viewController.navigationController as? BaseNavigationController
        navigationController?.updateColorScheme()
    }
}

class BaseNavigationController: UINavigationController {

    private static var appearanceInit: () = {

    }()

    var defaultColorScheme: Theme = .reach {
        didSet {
            if isViewLoaded {
                applyColorScheme(defaultColorScheme)
            }
        }
    }

    private lazy var divider: UIView = {
        let divider = UIView(frame: CGRect(x: 0, y: 0, width: self.navigationBar.frame.width, height: 1))
        divider.backgroundColor = Colors.gray100.color
        divider.frame = divider.frame.insetBy(dx: 20, dy: 0)
        divider.frame.origin.y = self.navigationBar.frame.height - 1
        return divider
    }()

    private var currentColorScheme: Theme = .reach

    private weak var originalInteractivePopGestureDelegate: UIGestureRecognizerDelegate?

    override var viewControllers: [UIViewController] {
        didSet {
            if let viewController = topViewController {
                self.checkNavigationBarPreferenceForViewController(viewController, animated: false)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupAppearance()
        applyColorScheme(defaultColorScheme)

    }

    private func applyColorScheme(_ colorScheme: Theme) {
        currentColorScheme = colorScheme

        // Some exceptions for clear navigation bar
        if colorScheme == .reach {
            navigationBar.barStyle = colorScheme.barStyle
            navigationBar.setBackgroundImage(colorScheme.navigationBackgroundImage, for: .default)
            navigationBar.backgroundColor = colorScheme.navigationBarBackgroundColor

        } else if colorScheme == .white {
            navigationBar.barStyle = colorScheme.barStyle
            navigationBar.setBackgroundImage(colorScheme.navigationBackgroundImage, for: .default)
            navigationBar.backgroundColor = colorScheme.navigationBarBackgroundColor
        } else if colorScheme == .whiteNoDivider {
            navigationBar.barStyle = colorScheme.barStyle
            navigationBar.setBackgroundImage(colorScheme.navigationBackgroundImage, for: .default)
            navigationBar.backgroundColor = colorScheme.navigationBarBackgroundColor
            navigationBar.shadowImage = UIImage()
            //navigationBar.addSubview(divider)
        } else if colorScheme == .clear {
            navigationBar.barStyle = colorScheme.barStyle
            self.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationBar.shadowImage = UIImage()
            self.navigationBar.backgroundColor = Colors.clear.color
        } else {}

        navigationBar.barTintColor = colorScheme.barTintColor
        navigationBar.tintColor = colorScheme.tintColor
        navigationBar.isTranslucent = true

        navigationBar.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor: colorScheme.titleColor
        ]

        //divider.isHidden = colorScheme == .whiteNoDivider

        setNeedsStatusBarAppearanceUpdate()
    }

    func setupAppearance() {
        _ = BaseNavigationController.appearanceInit
    }

    override func setNavigationBarHidden(_ hidden: Bool, animated: Bool) {
        super.setNavigationBarHidden(hidden, animated: animated)

        if hidden {
            originalInteractivePopGestureDelegate = interactivePopGestureRecognizer?.delegate
            interactivePopGestureRecognizer?.delegate = self
        } else {
            interactivePopGestureRecognizer?.delegate = originalInteractivePopGestureDelegate
            originalInteractivePopGestureDelegate = nil
        }
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        checkPreferredStyleForViewController(viewController)
        checkNavigationBarPreferenceForViewController(viewController, animated: animated)
    }

    override func popViewController(animated: Bool) -> UIViewController? {
        let poppedViewController = super.popViewController(animated: animated)
        checkPreferredStyleForViewController(topViewController)
        checkNavigationBarPreferenceForViewController(topViewController, animated: animated)
        return poppedViewController
    }

    override func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        let poppedViewControllers = super.popToViewController(viewController, animated: animated)
        checkPreferredStyleForViewController(topViewController)
        checkNavigationBarPreferenceForViewController(topViewController, animated: animated)
        return poppedViewControllers
    }

    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        let poppedViewControllers = super.popToRootViewController(animated: animated)
        checkPreferredStyleForViewController(topViewController)
        checkNavigationBarPreferenceForViewController(topViewController, animated: animated)
        return poppedViewControllers
    }

    func updateColorScheme() {
        checkPreferredStyleForViewController(topViewController)
    }

    private func checkPreferredStyleForViewController(_ viewController: UIViewController?) {
        if let child = viewController as? NavigationControllerChild {
            let preferredColorScheme = child.preferredColorScheme()
            if currentColorScheme != preferredColorScheme { // Clear one could change the foreground color
                applyColorScheme(preferredColorScheme)
            }
        } else {
            if currentColorScheme != defaultColorScheme {
                applyColorScheme(defaultColorScheme)
            }
        }
    }

    private func checkNavigationBarPreferenceForViewController(_ viewController: UIViewController?, animated: Bool) {
        let hideNavigationBar: Bool
        if let child = viewController as? NavigationControllerChild {
            hideNavigationBar = child.prefersNavigationBarHidden()
        } else {
            hideNavigationBar = false
        }

        if isNavigationBarHidden != hideNavigationBar {
            setNavigationBarHidden(hideNavigationBar, animated: animated)
        }
    }

}

extension BaseNavigationController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
