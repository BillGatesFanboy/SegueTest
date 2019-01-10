import UIKit

class ViewController: UIViewController {

    // Unwind to RootViewController
    @IBAction func didTouchClose(_ sender: Any) {
        // 👌 Working
        self.navigationController?.performSegue(withIdentifier: "unwindToRootSegue", sender: nil)
    }

    // Go to TableViewController
    @IBAction func didTapNext(_ sender: Any) {
        // 👌 Working
        self.performSegue(withIdentifier: "viewToTableSegue", sender: nil)
    }

}
