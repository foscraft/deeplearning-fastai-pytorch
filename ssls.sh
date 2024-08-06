#!/bin/bash

# List of domains to check
domains=("ims.co.ke" "payments.ims.co.ke")

for domain in "${domains[@]}"; do
  echo "Checking SSL certificate for $domain..."
  expiry_date=$(echo | openssl s_client -connect "$domain:443" -servername "$domain" 2>/dev/null | openssl x509 -noout -dates | grep 'notAfter' | cut -d= -f2)
  echo "$domain expires on $expiry_date"
done
