<!-- NOTE
SINGLE PAGE FORM ALONG WITH VALIDATION
NO PHP LEAKS BACK TO THE INDEX 
 -->
 <?php
  require_once("Includes/config.php");
  require_once("Includes/session.php");
  /*if(!(isset($_POST['email']&&isset($_POST['pass'])))) {
    location('index.php');
  }*/
   // if ($count === 0) {
  // echo "There were some problem";
// }
  ?>
<!DOCTYPE html>
<html>
  <head>
    <title>Login Page</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  </head>
  <body>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="index.php">Electric Bill</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="nav justify-content-center">
          <li class="nav-item">
            <a class="nav-link active" href="index.php">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="find_bill.php">Find Bill</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="payments.php">Payments</a>
          </li>
        </ul>
      </div>
    </nav>
    <div class="container">
      <div class="row justify-content-center mt-5">
        <div class="col-md-6">
          <div class="card">
            <div class="card-header">
              Find Bill Using Bill ID
            </div>
            <div class="card-body">
<form action="index.php" class="navbar-form navbar-right" role="form" method="post">
    <div class="form-group">
        <input type="text" placeholder="Bill ID" name="bill_id" id="bill_id" class="form-control">
    </div>
    <button type="login_submit" class="btn btn-primary" onclick=" validateForm();">Search</button>
</form>
</div>
          </div>
        </div>
      </div>
    </div>
    <div class="table-responsive">
                                    <table class="table table-hover table-striped table-bordered table-condensed">
                                        <thead>
                                            <tr>
                                                <th>Bill No.</th>
                                                <th>Bill Date</th>
                                                <th>Rate</th>
                                                <th>Amount</th>
                                                <th>Due Date</th>
                                                <th>STATUS</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            $query1 = "SELECT * FROM bill where id=60 ";
                                            $result1 = mysqli_query($con,$query1);

                                            //$result = retrieve_bills_history($_SESSION['uid'],$offset, $rowsperpage);
                                            // Initialising #
                                            while($row = mysqli_fetch_assoc($result1)){
                                            ?>
                                                <tr>
                                                    <td height="50"><?php echo 'B_'.$row['id'] ?></td>
                                                    <td height="50"><?php echo $row['date'] ?></td>
                                                    <td><?php echo $row['rate'] ?></td>
                                                    <td><?php echo 'TK.'.$row['amount'] ?></td>
                                                    <td><?php echo $row['due'] ?></td>
                                                    <td><?php echo $row['status'] ?></td>
                                                </tr>
                                            <?php  } ?>
                                        </tbody>
                                    </table>                  
                                </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>







