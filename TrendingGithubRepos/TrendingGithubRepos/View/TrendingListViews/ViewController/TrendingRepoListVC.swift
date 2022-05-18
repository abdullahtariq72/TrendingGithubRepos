//
//  ViewController.swift
//  TrendingGithubRepos
//
//  Created by Abdullah Tariq on 16/05/2022.
//

import UIKit
import Lottie

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
        configureLottieAnimation()
        repoListTableView.isHidden = true
        
        
    }
    
    // MARK: - SetupAnimationLogo
    func configureLottieAnimation(){
        showErrorView(retryCompletion: {
            self.repoListTableView.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.isData = true
                let s = SampleModel(name: "abdllah", heading: "testing", detail: "testing testing", isExpand: false)
                let s1 = SampleModel(name: "abdllah", heading: "testing", detail: "testing testing", isExpand: false)
                let s2 = SampleModel(name: "abdllah", heading: "testing", detail: "testing testing", isExpand: false)
                
                self.sampledata.append(s)
                self.sampledata.append(s1)
                self.sampledata.append(s2)
                self.repoListTableView.reloadData()
            }
            
            self.hideErrorView()
        })

    }
    
    /**
     setting up views
     */
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


extension UIViewController {
    
    func showErrorView(retryCompletion: @escaping () -> ()){
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        view.tag = Constants.RetryBtnTag
        let gifView = AnimationView()
        let animation = Animation.named("retry")
        gifView.contentMode = .scaleAspectFill
        gifView.animation = animation
        gifView.loopMode = .loop
        gifView.play()
        view.addSubview(gifView)
        gifView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            gifView.heightAnchor.constraint(equalToConstant: 300),
            gifView.widthAnchor.constraint(equalToConstant: 300),
            gifView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gifView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        let retryButton = UIButton()
        retryButton.clipsToBounds = true
        retryButton.layer.cornerRadius = 4.0
        retryButton.layer.borderWidth = 1.0
        retryButton.layer.borderColor = UIColor.systemGreen.cgColor
        retryButton.setTitleColor(.systemGreen, for: .normal)
        retryButton.setTitle(LanguageStrings.retry, for: .normal)
        retryButton.addAction {
            retryCompletion()
        }
        view.addSubview(retryButton)
        retryButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            retryButton.heightAnchor.constraint(equalToConstant: 40),
            retryButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            retryButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            retryButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
        
        self.view.addSubview(view)

    }
    func hideErrorView(){
        if let viewWithTag = self.view.viewWithTag(Constants.RetryBtnTag) {
            viewWithTag.removeFromSuperview()
        }
    }
}

extension UIControl {
    func addAction(for controlEvents: UIControl.Event = .touchUpInside, _ closure: @escaping()->()) {
        @objc class ClosureSleeve: NSObject {
            let closure:()->()
            init(_ closure: @escaping()->()) { self.closure = closure }
            @objc func invoke() { closure() }
        }
        let sleeve = ClosureSleeve(closure)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: controlEvents)
        objc_setAssociatedObject(self, "\(UUID())", sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}
