# Use Python38
FROM python:3.8-slim as flaskr

RUN apt-get update -y
RUN pip install --upgrade pip
RUN python3 --version
RUN pip3 --version

# Copy requirements.txt to the docker image and install packages
COPY requirements.txt /
RUN pip3 install -r requirements.txt

# Set the WORKDIR to be the folder
WORKDIR /app
COPY . /app

# EXPOSE port 5000
EXPOSE 5000

ENTRYPOINT [ "python3.8" ]
CMD ["app/main.py"]



# USER root
# WORKDIR /dbt_tutorial


# # dbt
# FROM fishtownanalytics/dbt:0.18.1
# USER root
# WORKDIR /dbt
# COPY --from=flaskr /app ./



