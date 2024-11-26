<?php
// config.php - Database configuration
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', '');
define('DB_NAME', 'student_db');
define('LOG_FILE', __DIR__ . '/debug.log');

// functions.php - Helper functions
function logMessage($message) {
    file_put_contents(LOG_FILE, date('Y-m-d H:i:s') . " - " . $message . PHP_EOL, FILE_APPEND);
}

function connectDB() {
    $db = mysqli_connect(DB_HOST, DB_USER, DB_PASS, DB_NAME);
    if (!$db) {
        logMessage("Database Connection Failed: " . mysqli_connect_error());
        die("Database Connection Failed.");
    }
    return $db;
}

// server.php - Main login processing
session_start();
ini_set('display_errors', 1);
error_reporting(E_ALL);

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['login_btn'])) {
    $errors = [];
    $username = trim($_POST['adminUsername'] ?? '');
    $password = trim($_POST['adminPassword'] ?? '');
    
    logMessage("Login attempt - Username: $username");
    
    if (empty($username)) {
        $errors[] = "Username is required";
    }
    if (empty($password)) {
        $errors[] = "Password is required";
    }
    
    if (empty($errors)) {
        $db = connectDB();
        $encrypted_password = md5($password); // Note: MD5 is kept for compatibility, should upgrade to password_hash
        
        $stmt = $db->prepare("SELECT * FROM admin_details WHERE admin_username = ? AND admin_password = ?");
        if (!$stmt) {
            logMessage("Prepare failed: " . $db->error);
            $errors[] = "System error occurred";
        } else {
            $stmt->bind_param("ss", $username, $encrypted_password);
            $stmt->execute();
            $result = $stmt->get_result();
            
            if ($result && $result->num_rows == 1) {
                $row = $result->fetch_assoc();
                $_SESSION['username'] = $row['admin_username'];
                $_SESSION['fname'] = $row['admin_firstname'];
                $_SESSION['lname'] = $row['admin_lastname'];
                $_SESSION['emailaddress'] = $row['admin_email'];
                $_SESSION['phonenumber'] = $row['admin_phone'];
                $_SESSION['success'] = "You are now logged in";
                
                logMessage("Login successful for username: $username");
                header('location: ./dashboard/');
                exit();
            } else {
                $errors[] = "Incorrect Username or Password";
                logMessage("Login failed for username: $username");
            }
            $stmt->close();
        }
        $db->close();
    }
    
    if (!empty($errors)) {
        $_SESSION['errors'] = $errors;
        header('location: index.php');
        exit();
    }
}
?>
