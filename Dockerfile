FROM python:2-slim as base
# source repo: https://github.com/docker-library/python
# git branch py2-branch ab8db2f^ && git co py2-branch
# based on Debian 10.13 (Buster)
# {python,pip}{,2,2.7} and virtualenv are in /usr/local/bin
# Don't mess up and use /usr/bin/python{2,2.7}!

RUN set -eux \
  \
  && apt-get -y update \
  && apt-get -y upgrade \
  && apt-get -y clean \
  && rm -rf /var/lib/apt \
  && pip --no-python-version-warning \
         --disable-pip-version-check \
	 --no-cache-dir list --outdated \
     | tail -n +3 \
     | awk '{ print $1 }' \
     | xargs pip --no-python-version-warning \
       	         --disable-pip-version-check \
		 --no-cache-dir install --upgrade \
  && pip --no-python-version-warning \
         config set global.no_python_version_warning True \
  && pip install --no-cache-dir virtualenv

FROM base
RUN useradd -c "Python user" -d /work -m python
USER python
WORKDIR /work
CMD ["bash"]
