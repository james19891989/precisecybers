<?php
    include 'server.php';
    $name = isset($_SESSION['fname']) ? $_SESSION['fname'] : '';
?>


<!-- index.php -->
<!DOCTYPE html>
<html lang="en">
<head>
    <title>PRECISE | Login</title>
    <?php include './components/header.php'; ?>
    <style>
        .error {
            color: red;
            margin: 10px 0;
        }
    </style>
</head>
<body style="background-color: #d2d6de;">
    <div class="container">
        <div class="row mt-5 login-page-row">
            <div class="col-md-5 mx-auto mt-5 login-page">
                <div class="login-page-header mb-4 text-center">
                    <h4 style="color: #fff">Precise Cybers</h4>
                    <img src="./static/images/logo/logo.jpeg" class="img-fluid rounded-circle" style="width: 90px; height: 90px;"/>
                </div>
                
                <?php if (isset($_SESSION['errors'])): ?>
                    <div class="error">
                        <?php 
                        foreach ($_SESSION['errors'] as $error) {
                            echo "<p>$error</p>";
                        }
                        unset($_SESSION['errors']);
                        ?>
                    </div>
                <?php endif; ?>
                
                <form method="POST" action="server.php" class="login-form">
                    <div class="form-group row">
                        <label for="adminUsername" class="col-sm-3 col-form-label">Username</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="adminUsername" name="adminUsername" required>
                        </div>
                    </div>
                    
                    <div class="form-group row">
                        <label for="adminPassword" class="col-sm-3 col-form-label">Password</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" id="adminPassword" name="adminPassword" required>
                        </div>
                    </div>
                    
                    <div class="form-group row">
                        <div class="col-sm-6">
                            <a href="#" class="text-success">Forgot Password?</a>
                        </div>
                        <div class="col-sm-6 text-right">
                            <button type="submit" name="login_btn" class="btn btn-primary"><strong>Sign In</strong></button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <?php include 'components/scripts.php'; ?>
</body>
</html>