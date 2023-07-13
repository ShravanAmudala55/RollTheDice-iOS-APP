import UIKit
class ViewController: UIViewController {

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var scoreTextField: UITextField!
    
    let diceArray = [
        UIImage(named: "DiceOne"),
        UIImage(named: "DiceTwo"),
        UIImage(named: "DiceThree"),
        UIImage(named: "DiceFour"),
        UIImage(named: "DiceFive"),
        UIImage(named: "DiceSix")
    ]
    
    var leftValue = 0
    var rightValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        becomeFirstResponder()
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            rollingDice()
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            rollDice()
        }
    }
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        rollDice()
    }
    
    func rollingDice() {
        
        leftValue = Int.random(in: 0...5)
        rightValue = Int.random(in: 0...5)
        
        diceImageView1.image = diceArray[leftValue]
        diceImageView2.image = diceArray[rightValue]
    }
    
    
    func rollDice() {
        rollingDice()
        
        diceImageView1.image = diceArray[leftValue]
        diceImageView2.image = diceArray[rightValue]
        
        let totalScore = leftValue + rightValue + 2
        scoreTextField.text = String(totalScore)
        
        
        
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
}
