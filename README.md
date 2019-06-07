Spending.gov.ua transactions data loading server
------------------------------------------------

Create `digdag.conf` file with a secret:

```
digdag.secret-encryption-key = MDEyMzQ1Njc4OTAxMjM0NQ==
# example
echo -n '16_bytes_phrase!' | openssl base64
MTZfYnl0ZXNfcGhyYXNlIQ==
```

Run docker console with postgresql db

`./run`

Start server

```
digdag server -o data -b 0.0.0.0 -c digdag.conf
```

Make sure data folder is not deleted


Create/update project:

```
digdag push --project workflows scheduled-transactions
```

Create secret for project's pg datbase:

```
secrets --project scheduled-transactions --set pg.password
```
