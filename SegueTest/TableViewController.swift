import UIKit

class TableCell: UITableViewCell {
}

class TableViewController: UITableViewController {
    
    // This initializer causes crash. 😩
//    required public init?(coder aDecoder: NSCoder) {
//        super.init(style: .plain)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Register TableCell.xib
        let nib = UINib(nibName: "TableCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "TableCell")
        self.tableView.tableFooterView = UIView(frame: .zero)
    }

}

extension TableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int { return 1 }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: TableCell = self.tableView.dequeueReusableCell(withIdentifier: "TableCell") as? TableCell else {
            return UITableViewCell()
        }
        cell.textLabel?.text = "Row \(indexPath.row)"
        return cell
    }

    // Go to UICollectionViewController
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        // ❌ The segue `tableToCollectionSegue` is connected from TableViewController to UICollectionViewController, but got unexpected error.
        // *** Terminating app due to uncaught exception 'NSInvalidArgumentException',
        // reason: 'Receiver (<SegueTest.TableViewController: 0x7feeea04a090>) has no segue with identifier 'tableToCollectionSegue''
        self.performSegue(withIdentifier: "tableToCollectionSegue", sender: nil)

        // ❌ The segue `tableToCollectionSegue` is not connected from UINavigationController to UICollectionViewController. This error is expected.
        // *** Terminating app due to uncaught exception 'NSInvalidArgumentException',
        // reason: 'Receiver (<SegueTest.TableViewController: 0x7feeea04a090>) has no segue with identifier 'tableToCollectionSegue''
        // self.navigationController?.performSegue(withIdentifier: "tableToCollectionSegue", sender: self)
    }

}
