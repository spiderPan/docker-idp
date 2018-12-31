#docker build -t fanshawe-idp .
#docker run -p 8080:80 -p 25:25 -v ${PWD}/app:/app fanshawe-idp
#docker exec -t -i b409cda46c9f /bin/bash

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

ADD ./assets/postfix.sh /postfix.sh
RUN chmod 755 /*.sh

CMD ["/postfix.sh"]
