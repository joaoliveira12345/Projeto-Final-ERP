<?php
$name = $_POST['name'];
$user_email = $_POST['email'];
$subject = $_POST['subject'];
$message = $_POST['message'];

$email_form = 'info@yourwebsite.com'; // Mudar o mail

$email_subject = "New Form Submission" // Mudar se necessario

$email_body = "User Name: $name.\n".
                "User Email: $user_email.\n".
                  "Subject: $subject.\n".
                    "User Message: $message.\n";

$to = '123456789@gmail.com'; // Mudar o email que vai receber os mails

$headers = "From: $email_form \r\n";

$headers .= "Reply-To: $user_email \r\n";

mail($to,$email_subject,$email_body,$headers);

header("Location: contact.html");

?>