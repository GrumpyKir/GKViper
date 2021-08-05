//
//  ViperViewController.swift
//
//  Created by  Кирилл on 21.08.2018.
//  Copyright © 2018 AppCraft. All rights reserved.
//

import GKExtensions

public protocol ViperViewInput: AnyObject {
    func setupInitialState(with viewModel: ViperViewModel)
    
    func beginLoading()
    func finishLoading(with error: Error?)
    
    func show(title: String?, message: String?, animated: Bool)
    func show(_ alertController: UIAlertController, animated: Bool)
}

public protocol ViperViewOutput: AnyObject {
    func viewIsReady(_ controller: UIViewController)
    
    func loadData()
    func reloadData()
    
    func goBack(animated: Bool)
    func close(animated: Bool)
}

open class ViperViewController<ViewOutput: ViperViewOutput>: UIViewController, ViperViewInput {
    
    // MARK: - Props
    public var output: ViewOutput?
    
    // MARK: - Lifecycle
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        self.output?.viewIsReady(self)
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    // MARK: - ViperViewInputProtocol
    open func setupInitialState(with viewModel: ViperViewModel) { }
    
    open func beginLoading() { }
    
    open func finishLoading(with error: Error?) {
        if let error = error {
            self.show(title: "Error".localized,
                      message: error.localizedDescription,
                      animated: true)
        }
    }
    
    open func show(title: String?, message: String?, animated: Bool) {
        DispatchQueue.main.async { [weak self] in
            let alertController = UIAlertController(title: title,
                                                    message: message,
                                                    preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "ОК".localized,
                                         style: .default,
                                         handler: nil)
            alertController.addAction(okAction)
            
            self?.present(alertController, animated: animated, completion: nil)
        }
    }
    
    open func show(_ alertController: UIAlertController, animated: Bool) {
        DispatchQueue.main.async { [weak self] in
            self?.present(alertController, animated: animated, completion: nil)
        }
    }
    
}
