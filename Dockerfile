# Hypnose container

# For x64 systems.
FROM base/archlinux
# For x32 systems.
#FROM archlinux
# For rapsberry pi.
#FROM ygrenzinger/archlinux-arm

# Installing system.

RUN pacman-db-upgrade 
RUN timeout -s 9 10 cat /dev/urandom > /dev/zero || true
RUN pacman-key --init
RUN pacman-key --populate archlinux
RUN pacman -Syy --noconfirm archlinux-keyring
RUN pacman-db-upgrade 
RUN pacman -Suy --noconfirm
RUN pacman-db-upgrade 
RUN pacman -Suy --noconfirm base base-devel python3 python-pip apache sqlite3 \
	git


# Copying requirements.txt
COPY ./requirements.txt /requirements.txt

# Installing dependencies
RUN pip install -r /requirements.txt
RUN pip install mod_wsgi
RUN rm /requirements.txt

# Add mod_wsgi :
#ENV APXS "/usr
RUN git clone https://github.com/GrahamDumpleton/mod_wsgi.git
RUN cd mod_wsgi && ./configure --with-python=$(which python) &&  make && make install
RUN cd && rm -rf /mod_wsgi

# PORTS :
EXPOSE 80

# VOLUMES :
# Export log files :
VOLUME /srv/http/www/logs
# Export database :
VOLUME /srv/http/www/data
# Sources : 
VOLUME /srv/http/www/htdocs

# Disable debug mode :
# RUN sed -i 's/DEBUG = True/DEBUG = False/' htdocs/hypnose/settings.py

# Entrypoint :
#ENTRYPOINT python manage.py runserver
CMD ["/usr/sbin/httpd", "-DFOREGROUND"]
