//
//  ViperPresenter.swift
//
//  Created by  Кирилл on 21.08.2018.
//  Copyright © 2018 AppCraft. All rights reserved.
//

import GKExtensions

public protocol ViperPresenterInput: AnyObject {
    associatedtype ViewInput = ViperViewInput
    associatedtype InteractorInput = ViperInteractorInput
    associatedtype RouterInput = ViperRouterInput
    
    var view: ViewInput? { get set }
    var interactor: InteractorInput? { get set }
    var router: RouterInput? { get set }
}

open class ViperPresenter<ViewInput: ViperViewInput, InteractorInput: ViperInteractorInput, RouterInput: ViperRouterInput>: ViperPresenterInput, ViperViewOutput, ViperInteractorOutput {
    
    // MARK: - Props
    public weak var view: ViewInput?
    public var interactor: InteractorInput?
    public var router: RouterInput?
    
    // MARK: - Initialization
    public init() { }
    
    // MARK: - ViperPresenterInputProtocol
    
    // MARK: - ViperViewOutputProtocol
    open func viewIsReady(_ controller: UIViewController) { }
    
    open func loadData() { }
    
    open func reloadData() { }
        
    open func goBack(animated: Bool) {
        self.router?.goBack(animated: animated)
    }
    
    open func close(animated: Bool) {
        self.router?.dismiss(animated: animated)
    }
    
    // MARK: - ViperInteractorOutputProtocol
    open func beginLoading() {
        self.view?.beginLoading()
    }
    
    open func finishLoading(with error: Error?) {
        self.view?.finishLoading(with: error)
    }
    
    open func provideMessage(_ title: String?, message: String?) {
        self.view?.show(title: title, message: message, animated: true)
    }
    
}
