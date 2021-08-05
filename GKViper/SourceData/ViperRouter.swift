//
//  ViperRouter.swift
//
//  Created by  Кирилл on 21.08.2018.
//  Copyright © 2018 AppCraft. All rights reserved.
//

import GKExtensions

public protocol ViperRouterInput: AnyObject {
    associatedtype ViewController = UIViewController
    
    var viewController: ViewController? { get set }
    
    func dismiss(animated: Bool)
    func goBack(animated: Bool)
    func goToRoot(animated: Bool)
}

open class ViperRouter<ViewController: UIViewController>: ViperRouterInput {
    
    // MARK: - Props
    public weak var viewController: ViewController?
    
    // MARK: - Initialization
    public init() { }
    
    // MARK: - ViperRouterInputProtocol
    open func dismiss(animated: Bool) {
        DispatchQueue.main.async { [weak self] in
            self?.viewController?.dismiss(animated: animated, completion: nil)
        }
    }
    
    open func goBack(animated: Bool) {
        DispatchQueue.main.async { [weak self] in
            self?.viewController?.navigationController?.popViewController(animated: animated)
        }
    }
    
    open func goToRoot(animated: Bool) {
        DispatchQueue.main.async { [weak self] in
            self?.viewController?.navigationController?.popToRootViewController(animated: animated)
        }
    }
    
    // MARK: - Module functions
    open func present(_ viewController: UIViewController, animated: Bool) {
        DispatchQueue.main.async { [weak self] in
            self?.viewController?.present(viewController, animated: animated, completion: nil)
        }
    }
    
    open func push(_ viewController: UIViewController, animated: Bool) {
        DispatchQueue.main.async { [weak self] in
            self?.viewController?.navigationController?.pushViewController(viewController, animated: animated)
        }
    }
        
}
