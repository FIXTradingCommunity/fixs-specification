# FIXS Recomended Cipher List
## Purpose
This list is the reference list of approved ciphers for use with FIXS

Ciphers are listed in groups under sub-headings, first by TLS Version and then by use-case

- [FIXS Recomended Cipher List](#fixs-recomended-cipher-list)
    - [Purpose](#purpose)
    - [Overview](#overview)
    - [TLS1.2](#tls12)
        - [Authentication](#authentication)
            - [TLS Certificate Authentication](#tls-certificate-authentication)
            - [TLS PSK Authentication](#tls-psk-authentication)

## Overview
The acronyms used in this appendix match those in the TLS Cipher Suite Registry which is authoritative and held at IANA for IETF. We have chosen to use these acronyms as opposed to, for example, using the ones from the OpenSSL cipher suite names. See
http://www.iana.org/assignments/tls-parameters/tls-parameters.xhtml or https://www.ietf.org/assignments/tls-parameters/tls-parameters.txt

## TLS1.2

### Authentication
#### TLS Certificate Authentication
The following cipher suite list when using certificates for authentication. This includes using certificates in Simple TLS in conjunction with FIXA. The list ensures Forward Secrecy, avoids deprecated ciphers and should achieve good performance. The cipher suites are specified in our order of preference, starting with the most preferred cipher suite.

```
TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256
TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384
TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA
TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA
TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256
TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384
TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
TLS_DHE_RSA_WITH_AES_128_GCM_SHA256
TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
TLS_DHE_RSA_WITH_AES_256_GCM_SHA384
TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA
TLS_DHE_RSA_WITH_AES_128_CBC_SHA
TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA
TLS_DHE_RSA_WITH_AES_256_CBC_SHA
TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256
TLS_DHE_RSA_WITH_AES_128_CBC_SHA256
TLS_DHE_RSA_WITH_AES_256_CBC_SHA256
TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384
```
This list matches what is recommended as best practice from SSL Labs currently (November 2016), except we have given preference to performance of the TLS Record Protocol rather than the TLS Handshake Protocol's performance. The list should be used in conjunction with Session Caching.

The list details ECDSA certificate cipher suites followed by RSA certificate ones. It is possible to support both an ECDSA certificate and a RSA certificate at an end point, but only one certificate can be used at a time. In practice, only one kind of certificate is needed. Thus, if you are using an RSA certificate, the ECDSA cipher suites will be ignored so they can be omitted. Likewise, the RSA cipher suites will be ignored and can be omitted for an ECDSA certificate.

#### TLS PSK Authentication

It is recommended to use the following cipher suite list when using PSKs for authentication. This is because the list ensures Forward Secrecy, avoids deprecated ciphers and should achieve good performance. The cipher suites are specified in our order of preference, starting with the most preferred cipher suite.
```
TLS_DHE_PSK_WITH_AES_128_GCM_SHA256
TLS_DHE_PSK_WITH_AES_256_GCM_SHA384
TLS_ECDHE_PSK_WITH_AES_128_CBC_SHA
TLS_DHE_PSK_WITH_AES_128_CBC_SHA
TLS_ECDHE_PSK_WITH_AES_256_CBC_SHA
TLS_DHE_PSK_WITH_AES_256_CBC_SHA
TLS_ECDHE_PSK_WITH_AES_128_CBC_SHA256
TLS_DHE_PSK_WITH_AES_128_CBC_SHA256
TLS_ECDHE_PSK_WITH_AES_256_CBC_SHA384
TLS_DHE_PSK_WITH_AES_256_CBC_SHA384
```
This list follows the same logic as in the list above for [certificate authentication](#tls-certificate-authentication), except it uses the cipher suites available for PSK authentication.
