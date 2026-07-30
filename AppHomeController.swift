import UIKit
import SnapKit
import RouterKit



class AppHomeController: UIViewController {
    let homeLabel = UILabel()
    
    let jumpToMsgListBtn = UIButton(type: .custom)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HOME"
        view.backgroundColor = .systemGroupedBackground
        
        setupUI()
        setupJumpBtn()
    }
    
    
    private func setupUI() {
        homeLabel.text = "EMAIL - HOME"
        homeLabel.textColor = .black
        homeLabel.font = .systemFont(ofSize: 30, weight: .heavy)
        homeLabel.textAlignment = .center
        
        view.addSubview(homeLabel)
        
        homeLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(100)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupJumpBtn() {
        jumpToMsgListBtn.setTitle("[MESSAGE LIST]", for: .normal)
        jumpToMsgListBtn.setTitleColor(.black, for: .normal)
        jumpToMsgListBtn.setTitleColor(.black.withAlphaComponent(0.5), for: .highlighted)
        jumpToMsgListBtn.backgroundColor = .lightGray
        jumpToMsgListBtn.layer.cornerRadius = 10
        jumpToMsgListBtn.addTarget(self, action: #selector(jumpToMsgList), for: .touchUpInside)
        
        view.addSubview(jumpToMsgListBtn)
        
        jumpToMsgListBtn.snp.makeConstraints { make in
            make.top.equalTo(homeLabel.snp.bottom).offset(100)
            make.centerX.equalToSuperview()
            make.width.equalTo(180)
            make.height.equalTo(60)
        }
    }
    
    
    @objc func jumpToMsgList() {
        guard let target = URL(string: "msgList://list") else { return }
        _ = URLRouter.shared.openURL(url: target)
    }
    
    
}




#Preview {
    let vc = AppHomeController()
    return vc
}
