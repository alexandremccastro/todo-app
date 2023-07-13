FROM ubuntu:22.04 

WORKDIR /var/www/todo-app

COPY . .

RUN apt update && apt install apache2 -y && apt install libdbi-perl -y \
    && apt install libdbd-mysql-perl -y && apt install gcc -y

# Site config file for apache2
RUN cp ./todo-app.conf /etc/apache2/sites-available/todo-app.conf

# Install Perl required modules
RUN apt install cpanminus -y && cpan CGI && cpan Text::Template \
    && cpan CGI::Session && cpan Dotenv && cpan DBI && cpan DBD::mysql \
    && cpan Data::Dump && cpan Digest::SHA3 && cpan Crypt::PBKDF2 \
    && cpan JSON

# Enable modules and site
RUN a2enmod cgid && a2enmod rewrite && a2ensite todo-app

EXPOSE 80

ENTRYPOINT service apache2 restart && tail -f /dev/null
