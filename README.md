# p12-to-crt
This is a tool to convert SSL-certificates in *.p12-format to a certificate in *.crt and *.key-files

# usage

WARNING: **NEVER EVER USE THIS TOOL IN A PUBLIC FOLDER**
```
git clone https://github.com/null/p12-to-crt
cd p12-to-crt
```

copy all your *.p12-certificates into the folder "certificates"

exec concerter:

```
./convert-certs.sh
```

In the certificates-folder there are now new files:

- *certname*.key - the private key from the certificate
- *certname*.crt - the certificate

After copying the certificates, it's problably a good idea to truncate the certificates-folder:

```
rm -f certificates/*
```
