# Create the Certificates
$AppName = "KopiCloud"
$RootCert = New-SelfSignedCertificate -Type Custom -KeySpec Signature -Subject "CN=$($AppName)RootCert" -KeyExportPolicy Exportable -HashAlgorithm sha256 -KeyLength 2048 -CertStoreLocation "Cert:\CurrentUser\My" -KeyUsageProperty Sign -KeyUsage CertSign
$ChildCert = New-SelfSignedCertificate -Type Custom -DnsName "$($AppName)ChildCert" -KeySpec Signature -Subject "CN=$($AppName)ChildCert" -KeyExportPolicy Exportable -HashAlgorithm sha256 -KeyLength 2048 -CertStoreLocation "Cert:\CurrentUser\My" -Signer $rootcert -TextExtension @("2.5.29.37={text}1.3.6.1.5.5.7.3.2")

# Export the Certificate
Export-Certificate -Type CERT -Cert $rootcert -FilePath ".\$($AppName)-RootCert.crt"
