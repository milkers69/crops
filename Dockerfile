FROM alpine:3.20.1

# install system packages
RUN  apk add --no-cache --upgrade python3 py3-pip python3-dev

# make and move into crops folder
WORKDIR crops

# copy files to app folder
COPY ["src/*", "./"]

# print contents of app folder for debug purposes
RUN ls -la

# install requirements
RUN pip3 install --upgrade pip --break-system-packages
RUN pip3 install -r requirements.txt --break-system-packages

# run app.py
ENTRYPOINT ["python3", "/crops/main.py"]
