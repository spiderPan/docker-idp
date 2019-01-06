FROM mattrayner/lamp:latest-1604-php7

# Add new user pan
RUN useradd -ms /bin/bash pan

# Install Postfix and Mailutils
RUN apt-get update && apt-get install -y \
    postfix \
    mailutils

COPY ./postfix/ /etc/postfix/

# Reload mail mapping
RUN postmap /etc/postfix/transport
RUN postmap /etc/postfix/recipient_canonical
RUN postmap /etc/postfix/sender_canonical

CMD ["/run.sh"]
