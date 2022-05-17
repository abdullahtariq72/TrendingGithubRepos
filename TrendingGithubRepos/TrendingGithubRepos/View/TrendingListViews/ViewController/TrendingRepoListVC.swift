//
//  ViewController.swift
//  TrendingGithubRepos
//
//  Created by Abdullah Tariq on 16/05/2022.
//

import UIKit


struct SampleModel{
    var name: String = ""
    var heading: String = ""
    var detailInfo: String =  ""
    var isExpand = false
    
    init(name: String, heading: String, detail: String, isExpand: Bool) {
        self.name = name
        self.heading = heading
        self.detailInfo = detail
        self.isExpand = isExpand
    }
}

class TrendingRepoListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var repoListTableView: UITableView!
    let refreshControl = UIRefreshControl()
    var isData = false
    var sampledata = [SampleModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configureTableView()
        configureNibs()
        setupViews()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.isData = true
            var s = SampleModel(name: "abdllah", heading: "testing", detail: "testing testing", isExpand: false)
            var s1 = SampleModel(name: "abdllah", heading: "testing", detail: "testing testing", isExpand: false)
            var s2 = SampleModel(name: "abdllah", heading: "testing", detail: "testing testing", isExpand: false)
            
            self.sampledata.append(s)
            self.sampledata.append(s1)
            self.sampledata.append(s2)
            self.sampledata.append(s)
            self.sampledata.append(s1)
            self.sampledata.append(s2)
            self.sampledata.append(s)
            self.sampledata.append(s1)
            self.sampledata.append(s2)
            self.sampledata.append(s)
            self.sampledata.append(s1)
            self.sampledata.append(s2)
            self.sampledata.append(s)
            self.sampledata.append(s1)
            self.sampledata.append(s2)
            self.repoListTableView.reloadData()
            
        }
        
    }
    
    func setupViews(){
        
        refreshControl.addTarget(self, action:  #selector(refreshData), for: .valueChanged)
        repoListTableView.refreshControl = refreshControl
    }
    
    /**
     setting up delegate and datasource for tableviews
     */
    func configureTableView(){
        self.repoListTableView.delegate = self
        self.repoListTableView.dataSource = self
        self.repoListTableView.separatorStyle = .none
    }
    /**
     attaching nibs files to the viewcontroller
     */
    func configureNibs(){
        repoListTableView.register( UINib(nibName: NIB_NAME.shimmerCell, bundle: Bundle.main), forCellReuseIdentifier:  CELL_IDENTIFIER.shimmerCell)
        repoListTableView.register( UINib(nibName: NIB_NAME.repoListTableViewCell, bundle: Bundle.main), forCellReuseIdentifier:  CELL_IDENTIFIER.repoListListCell)
    }
    
    //MARK: - Action to handle Pull To Refresh
    @objc func refreshData() {
        self.view.isUserInteractionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.refreshControl.endRefreshing()
            self.view.isUserInteractionEnabled = true
        }
        
    }
    
    //MARK: TableView Overidden Methods
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if !isData{
            return 80
        }else{
            return UITableView.automaticDimension
        }
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !isData{
            return 10
        }else{
            return sampledata.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if !isData{
            let cell = tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIER.shimmerCell) as! ListShimmerCell
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIER.repoListListCell) as! RepoListTableViewCell
            cell.model = sampledata[indexPath.row]
            cell.setUpCell()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = IndexPath(item: indexPath.row, section: 0)
        if self.sampledata[indexPath.row].isExpand == true{
            self.sampledata[indexPath.row].isExpand = false
        }else{
            self.sampledata[indexPath.row].isExpand = true
        }
        repoListTableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
    }
}

