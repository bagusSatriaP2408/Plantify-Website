<?php 

require 'functions.php';

session_start();

$kode_ref = array("admin" => "123", "manajer" => "321");
$errors = array();
$next = false;

if (isset($_POST['next'])) {
    $roles = $_POST['roles'];
    $ref = htmlspecialchars($_POST['ref']);
    
    $_SESSION['roles'] = $roles;
    
    validateRef($errors, $ref, $roles, $kode_ref);

    $cek = "";
    foreach ($errors as $error) {
        $cek .= $error;
    }
    if (strlen($cek) == 0) {
        $next = true;
    }
}

?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="assets/styles/style.css">
</head>
<body>
    
    <div class="form-container">
        <form action="<?php echo $next ? "register_id.php" : "register_role.php"?>" method="post">
            <h2>Register Now</h2>

            <div class="input-container">
                <label for="roles">Pilih Role</label>
                <select name="roles" id="roles">
                    <option value="admin">Admin</option>
                    <option value="manajer" <?php echo (isset($_POST["roles"]) && $_POST["roles"] === "manajer") ? "selected" : ''?>>Manajer</option>
                    <option value="customer" <?php echo (isset($_POST["roles"]) && $_POST["roles"] === "customer") ? "selected" : ''?>>Customer</option>
                </select>
            </div>
            <div class="input-container">
                <label for="ref">Kode Refferal</label>
                <input type="password" name="ref" id="ref" value="<?php echo $_POST["ref"] ?? '' ?>">
                <span class="error-msg"><?php echo $errors["ref"] ?? '' ?></span>
                <span class="roles-note">*isi jika memilih admin atau manajer</span>
            </div>
            <button type="submit" name="next">Selanjutnya</button>
            <p class="link">sudah punya akun? <a href="login.php">login now</a></p>
        </form>
    </div>

</body>
</html>
