//
//  ViewController.swift
//  TrendingGithubRepos
//
//  Created by Abdullah Tariq on 16/05/2022.
//

import UIKit

class TrendingRepoListVC: UIViewController, UITableViewDataSource, UITableViewDelegate, RepoListViewDelegate {
    
       //MARK: - IBOutlets
    @IBOutlet weak var repoListTableView: UITableView!
    
    //MARK: - DataMemebers
    let refreshControl = UIRefreshControl()
    var isPullToRefresh = false
    var repoListModel: GithubReposListModel?
    private let githubRepoPresenter = GithubRepoPresenter(repoListService: RepoListService())
    
    //MARK: - setting up viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        configureTableView()
        configureNibs()
        
        requestRepoListData()

    }
    
    //MARK: - setting up views
    func setupViews(){
        refreshControl.addTarget(self, action:  #selector(refreshData), for: .valueChanged)
        repoListTableView.refreshControl = refreshControl
    }
    
    //MARK: - setting up delegate and datasource for tableviews
    func configureTableView(){
        self.repoListTableView.delegate = self
        self.repoListTableView.dataSource = self
        self.repoListTableView.separatorStyle = .none
    }
    
    //MARK: - Attaching nibs files to the viewcontroller
    func configureNibs(){
        repoListTableView.register( UINib(nibName: NIB_NAME.shimmerCell, bundle: Bundle.main), forCellReuseIdentifier:  CELL_IDENTIFIER.shimmerCell)
        repoListTableView.register( UINib(nibName: NIB_NAME.repoListTableViewCell, bundle: Bundle.main), forCellReuseIdentifier:  CELL_IDENTIFIER.repoListListCell)
    }
    
    //MARK: - Action to handle Pull To Refresh
    @objc func refreshData() {
        isPullToRefresh = true
        self.view.isUserInteractionEnabled = false
        requestRepoListData()
    }
    
    //MARK: - Request Presenter to fetch data from API
    func requestRepoListData(){
        githubRepoPresenter.repoListViewDelegate = self
        githubRepoPresenter.fetchGitRepoList()
    }
    
    //MARK: - RepoList Presenter Delegate method to show data
    func displayRepoData(model: GithubReposListModel?, msg: String?) {
        if isPullToRefresh {
            self.refreshControl.endRefreshing()
            self.view.isUserInteractionEnabled = true
        }
    
        if let _ = msg{
            self.repoListTableView.isHidden = true
            self.showErrorView { [weak self] in
                self?.hideErrorView()
                self?.repoListTableView.isHidden = false
                self?.requestRepoListData()
            }
        }else{
            self.repoListModel = model
            self.repoListTableView.reloadData()
        }
    }
    
    //MARK: - TableView delegate Methods
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let _ = repoListModel else { return 80}
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let model = repoListModel else { return 10}
        return model.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let repoListModel = repoListModel {
            let cell = tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIER.repoListListCell) as! RepoListTableViewCell
            cell.setUpCell(dataItem: repoListModel.items[indexPath.row])
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIER.shimmerCell) as! ListShimmerCell
            cell.setUpCell()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let repoListModel = repoListModel {
            let item = repoListModel.items[indexPath.row]
            let indexPath = IndexPath(item: indexPath.row, section: 0)
            item.isExpanded = !item.isExpanded
            repoListTableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
}
