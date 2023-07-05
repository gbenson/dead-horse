# Dead horse
Docker image for Python 2 work.

## Usage
`cd` into your project directory, then enter the Python 2 world:
```sh
cd /where/ever
docker run --rm -it --mount type=bind,src=$(pwd),target=/work gbenson/python:2
```
Create a virtual environment:
```sh
virtualenv venv2
. venv2/bin/activate
```
Stop pip complaining all the time:
```sh
pip config set global.no_python_version_warning True
```
