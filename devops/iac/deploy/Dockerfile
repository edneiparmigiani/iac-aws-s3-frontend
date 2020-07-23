FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y gnupg2 && \
    apt-get install -y wget && \
    apt-get install -y unzip && \
    wget https://releases.hashicorp.com/terraform/0.12.7/terraform_0.12.7_linux_amd64.zip && \
    unzip ./terraform_0.12.7_linux_amd64.zip -d /usr/local/bin/ && \
    apt install -y docker.io && \
    apt-get -y install python3 && \
    apt install -y python3-pip && \
    pip3 install awscli --upgrade && \
    mkdir /build && \
    mkdir /build/iac && \
    mkdir /build/app

RUN wget https://storage.googleapis.com/golang/go1.11.2.linux-amd64.tar.gz && \
    tar -xvf go1.11.2.linux-amd64.tar.gz && \
    mv go /usr/local

ENV GOPATH $HOME/work
ENV PATH $PATH:/usr/local/go/bin:$GOPATH/bin
ENV FILE_APP_MD5 "md5_file.txt"
ENV APP_FOLDER "/build/app"

ARG DOMAIN
ARG BUCKET_ARTIFACT_TRACEABILITY_NAME
ARG DIST_FOLDER

ENV DOMAIN $DOMAIN
ENV BUCKET_ARTIFACT_TRACEABILITY_NAME $BUCKET_ARTIFACT_TRACEABILITY_NAME
ENV DIST_FOLDER $DIST_FOLDER

COPY . /build/iac

WORKDIR /build/iac

RUN chmod +x deploy.sh && \
    chmod +x md5_file/main.go

CMD go run md5_file/main.go && \
    cp /build/iac/md5_file.txt /build/app && \
    ls -la /build/app && \
    ./deploy.sh