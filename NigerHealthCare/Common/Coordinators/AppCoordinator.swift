//
//  AppCoordinator.swift
//  Reach
//
//  Created by Abhayam Rastogi on 14/06/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import UIKit

// MARK: - Coordinator keys
private enum AppChildCoordinator {
    case splash
    case onboarding
    case login
    case registration
    case vision
    case barrier
    case habit
    case selectedHabit
    case searchHabit
    case groupHabit
    case manageHabit
    case habitDetail
    case home
    case myBuddy
    case addBuddy
    case main
    case welcome
    case linkAccount
}

class AppCoordinator: Coordinator {
    
    private let window: UIWindow
    
    private var rootNavigationController: BaseNavigationController? {
        didSet{
            navigationController = rootNavigationController
        }
    }

    private var rootViewController: BaseNavigationController{
        return rootNavigationController ?? BaseNavigationController()
    }
    
    var navigationController: BaseNavigationController?

    private var childCoordinators = [AppChildCoordinator: Coordinator]()

    init(window: UIWindow) {
        self.window = window
        rootNavigationController = BaseNavigationController()
        self.window.rootViewController = rootViewController
    }

    func start() {
        //showSplash()
    }
    
    func finish() {
        childCoordinators.keys.forEach { [unowned self] in
            self.removeCoordinator(for: $0)
        }
        
        childCoordinators.removeAll()
    }

    func reset() {
        rootNavigationController = BaseNavigationController()
        self.window.rootViewController = rootViewController
        
        finish()
        start()
    }
    
    deinit {
        print("deinit called")
    }

    fileprivate func removeCoordinator(for key: AppChildCoordinator) {
        let coordinator = childCoordinators[key]
        coordinator?.finish()
        childCoordinators[key] = nil
    }
    
//    private func showSplash() {
//        let splashCoordinator = SplashCoordinator(presenter: rootViewController)
//        splashCoordinator.delegate = self
//        splashCoordinator.start()
//        childCoordinators[.splash] = splashCoordinator
//    }
//
//    private func showMain() {
//        let coordinator = MainCoordinator(presenter: window)
//        coordinator.delegate = self
//        coordinator.start()
//        childCoordinators[.main] = coordinator
//    }
//
//    private func showOnboarding(params: OnboardingInitParams) {
//        let onboardingCoordinator = OnboardingCoordinator(presenter: rootViewController, params: params)
//        onboardingCoordinator.delegate = self
//        onboardingCoordinator.start()
//        childCoordinators[.onboarding] = onboardingCoordinator
//    }
//
//    private func showWelcome(params: WelcomeInitParams) {
//        let welcomeCoordinator = WelcomeCoordinator(presenter: rootViewController, params: params)
//        welcomeCoordinator.delegate = self
//        welcomeCoordinator.start()
//        childCoordinators[.welcome] = welcomeCoordinator
//    }
    
 
    
}

