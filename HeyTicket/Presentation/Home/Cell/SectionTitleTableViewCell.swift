//
//  SectionTitleTableViewCell.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/04.
//

import UIKit
import HeyTicketKit

class SectionTitleTableViewCell: BaseTableViewCell{
    
    var title: String!{
        didSet{
            titleLabel.text = title
        }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Typo.font(type: .Bold, size: 18)
       return label
    }()
    
    override func hierarchy() {
        baseView.addSubview(titleLabel)
    }
    
    override func layout() {
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().inset(10)
        }
    }
    
}

protocol MoreSectionItemDelegate: AnyObject{
    func willMoveMoreItemViewController()
}

class SectionTitleWithMoreFlowTableViewCell: SectionTitleTableViewCell{
    
    weak var delegate: MoreSectionItemDelegate?
    
    private let moreStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.alignment = .center
        return stackView
    }()
    private let moreLabel: UILabel = {
        let label = UILabel()
        label.text = "더보기"
        label.textColor = Color.moreGrey
        label.setTypo(Typo.font(type: .Medium, size: 14))
        return label
    }()
    private let moreImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Image.arrowRight.withTintColor(Color.moreGrey)
        return imageView
    }()
    
    override func hierarchy() {
        super.hierarchy()
        baseView.addSubview(moreStackView)
        moreStackView.addArrangedSubviews([moreLabel, moreImage])
    }
    
    override func layout() {
        super.layout()
        moreStackView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(20)
            $0.bottom.equalToSuperview().inset(12)
            $0.trailing.equalToSuperview().inset(16)
        }
    }
    
    override func initialize() {
        moreStackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moreStackViewDidTap)))
    }
    
    @objc private func moreStackViewDidTap(){
        delegate?.willMoveMoreItemViewController()
    }
    
    
}
