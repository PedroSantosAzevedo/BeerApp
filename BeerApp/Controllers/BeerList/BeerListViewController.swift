//
//  BeerListViewController.swift
//  BeerApp
//
//  Created by Pedro Azevedo on 23/01/21.
//

import UIKit

class BeerListViewController: UIViewController {
    
//MARK:- Controller Variables
    var listView:BeerListView {return self.view as! BeerListView}
    var viewModel:BeerListViewModel!
    
    enum TableViewSection:Int,CaseIterable{
        case Beers = 0
        case Loading = 1
    }
    
//MARK:- Init
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view = BeerListView()
        self.viewModel = BeerListViewModel()
        setDelegates()
        setBindings()
        addTargets()
        setTitle()
        
    }
    
    
    private func setBindings(){
        viewModel.beerStatus.bind { (status) in
            self.setView(with:status)
        }
    }
    
    private func setDelegates(){
        listView.tableView.dataSource = self
        listView.tableView.delegate = self
    }
    
    private func setTitle(){
        self.navigationItem.title = "Beer List"
    }
    
    private func addTargets(){
        listView.reloadButton.addTarget(self, action: #selector(reload), for: .touchUpInside)
    }
    
    @objc func reload(){
        self.viewModel.getBeerList()
    }
    
}

//MARK:- TableView
extension BeerListViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return TableViewSection.allCases.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section{
        case TableViewSection.Beers.rawValue:
            return viewModel.beers.count
        case TableViewSection.Loading.rawValue:
            return self.viewModel.isLoadingMoreBeer ? 1 : 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section{
        case TableViewSection.Beers.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: BeerListTableViewCell.reusableIdentifier, for: indexPath) as! BeerListTableViewCell
            cell.setUp(beer: viewModel.beers[indexPath.row])
            return cell
        case TableViewSection.Loading.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: LoadingTableViewCell.reusableIdentifier, for: indexPath) as! LoadingTableViewCell
            cell.setUp()
            return cell
        default:
            let cell = UITableViewCell()
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath){
        if indexPath.section == TableViewSection.Beers.rawValue{
            let cell = tableView.dequeueReusableCell(withIdentifier: BeerListTableViewCell.reusableIdentifier, for: indexPath) as! BeerListTableViewCell
            cell.titleLabel.restartLabel()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == TableViewSection.Beers.rawValue{
            let beer = viewModel.beers[indexPath.row]
            let vc = BeerDetailViewController()
            vc.beer = beer
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offsetY > contentHeight - scrollView.frame.height {
          
            self.viewModel.getBeerList()
        }
    }
    
    
}

//MARK:- ViewStatus
extension BeerListViewController{
    private func setView(with status:ViewStatus){
        
 
        
        switch status{
        case .loading:
            listView.tableView.reloadData()
            debugPrint("loading")
        case .loaded:
            listView.reloadButton.isHidden = true
            listView.tableView.isHidden = false
            listView.errorLabel.isHidden = true
            listView.tableView.reloadData()
            debugPrint("loaded")
        case .loadingMore:
            listView.reloadButton.isHidden = true
            listView.tableView.isHidden = false
            listView.errorLabel.isHidden = true
            listView.tableView.reloadData()
            debugPrint("loadingMore")
        case .error(let errorString):
            listView.reloadButton.isHidden = false
            listView.errorLabel.isHidden = false
            listView.tableView.isHidden = true
            debugPrint("error: " + errorString )
        default:
            debugPrint("[BeerListViewController]:No view Status")
        }
        
    }
    
}
