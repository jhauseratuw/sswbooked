<?php 

define("ROOT_DIR", '../');
require_once(ROOT_DIR . 'lib/Application/Authentication/namespace.php');
require_once(ROOT_DIR . 'lib/Common/namespace.php');
require_once(ROOT_DIR . 'lib/Database/namespace.php');
require_once(ROOT_DIR . 'lib/Database/Commands/namespace.php');
require_once(ROOT_DIR . 'Domain/Values/RoleLevel.php');

session_start();
if (empty($_SESSION['token'])) {
    $_SESSION['token'] = bin2hex(random_bytes(32));
}
$token = $_SESSION['token'];

// TODO: testing local environment
if ($_SERVER['HTTP_HOST'] === "oldlocal.depts.washington.edu") {
    $_SERVER['REMOTE_USER'] = Configuration::Instance()->GetSectionKey('development', 'netid');
}
$netid = $_SERVER['REMOTE_USER'];

$resumeUrl = $_GET['resume'];

$command = new LoginCommand($netid);
$reader = ServiceLocator::GetDatabase()->Query($command);
$row = $reader->GetRow();
if ($row) {
    $is_active_status = $row['status_id'] == 1;
    if (! $is_active_status) {
        header('Location: index.php');
        exit();
    }
} else {
    header('Location: register.php');
    exit();
}
?>

<!DOCTYPE html>
<html>
<body style="display: none">
    <form role="form" name="login" id="login" method="post" action="index.php">
        <input name="token" value="<?= $token ?>" type="hidden">
        <input name="login" value="submit">
        <input type="hidden" name="resume" value="<?= $resumeUrl ?>"/>
        <input type="hidden" name="login_method" value="shibboleth"/>
    </form>

    <script type="text/javascript">
        document.getElementById('login').submit();
    </script>
</body>

</html>