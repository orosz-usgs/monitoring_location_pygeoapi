FROM usgswma/python:debian-slim-buster-python-3.7-e923cf03e5573ba531a90edc9b8ae0f5f7cb6e13

ENV BUILD_DEPS="git"
ENV PIP_PACKAGES="gunicorn==19.9.0 gevent==1.4.0"

ENV PIP3="pip3 --trusted-host pypi.org --trusted-host files.pythonhosted.org"
ENV GIT_SSL_NO_VERIFY=true

# Install dependencies
RUN apt-get --no-install-recommends install -y ${BUILD_DEPS}

# Pull pygeoapi from git repository
RUN git clone https://github.com/ACWI-SSWD/pygeoapi.git

# Install pygeoapi
RUN \
	cd /home/python/pygeoapi \
	&& ${PIP3} install ${PIP_PACKAGES} \
	&& ${PIP3} install -r requirements.txt \
	&& ${PIP3} install flask_cors psycopg2-binary \
	&& ${PIP3} install -e .

COPY --chown=$USER ./local.config.yml /pygeoapi/local.config.yml
RUN cp /home/python/pygeoapi/docker/entrypoint.sh /entrypoint.sh

WORKDIR /pygeoapi
EXPOSE 8080
USER $USER
ENTRYPOINT ["/entrypoint.sh"]
