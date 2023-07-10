FROM ubuntu:22.04 

WORKDIR /var/www/todo-app

COPY . .

RUN apt update && apt install apache2 -y

# Site config file for apache2
RUN cp ./todo-app.conf /etc/apache2/sites-available/todo-app.conf

# Install Perl required modules
RUN apt install cpanminus -y && cpan install CGI && cpan install Text::Template \
    && cpan install CGI::Session && cpan install Data::Dumper

# Enable modules and site
RUN a2enmod cgid && a2enmod rewrite && a2ensite todo-app

EXPOSE 80

ENTRYPOINT service apache2 restart && tail -f /dev/null
