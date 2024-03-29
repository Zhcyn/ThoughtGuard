import UIKit
import Anchors
class LearnViewController: UIViewController {
    var index = 0
    let questionsArray = ["What is an intrusive thought?", "What can I do to treat intrusive thoughts?", "How does counting help?" ]
    let answersArray = ["An intrusive thought is an unwelcome involuntary thought, image, or unpleasant idea that can feel difficult to manage or eliminate. \n\n\n\n For example:\n\n\n \"I'm not good enough.\"\n\n \"I should do this...\"\n\n\"I'm a burden on others.\"\n\n\n","One type of treatment is to monitor these thoughts by counting them.","Self-monitoring is proven to help develop self-control and decrease intrusive thoughts. At first you will notice that the number increases; this will happen for several days as you get better at identifying intrusive thoughts. Soon you will see that the daily total plateaus after 7 - 10 days, followed by a decrease in intrusive thoughts."]
    let questionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        return label
    }()
    let answerLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Learn"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.questionLabel.text = questionsArray[index]
        self.answerLabel.text = answersArray[index]
        self.view.addSubview(self.questionLabel)
        self.view.addSubview(self.answerLabel)
        activate(
                 self.questionLabel.anchor.top.constant(50),
                 self.questionLabel.anchor.paddingHorizontally(15),
                 self.answerLabel.anchor.paddingHorizontally(15),
                 self.answerLabel.anchor.top.equal.to(self.questionLabel.anchor.bottom).constant(40)
        )
    }
}
