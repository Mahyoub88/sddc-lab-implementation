# Exchange Server 2013 — Exchange Management Shell commands used on the e-mail server VM
# Domain: Active Directory domain hosted on the domain-controller VM (Windows Server 2008 R2)

# 1) Move the mailbox database file to a dedicated disk (J:)
Move-DatabasePath -Identity "Mailbox Database 0252873693" `
                  -EdbFilePath "J:\exdb\Mailbox Database 0252873693.edb"

# 2) Bulk-enable mailboxes for every user account in an organisational unit
#    (replace <OU> and <Database> with the OU and target mailbox database)
Get-User -OrganizationalUnit "<OU>" |
    Where-Object { $_.RecipientType -eq "User" } |
    Enable-Mailbox -Database "<Database>"

# 3) Users then sign in once at https://<server>/owa to activate their mailbox;
#    administration is done in the Exchange Admin Center at https://<server>/ecp
