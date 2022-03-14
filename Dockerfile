FROM ubuntu:20.04
RUN mkdir /code
COPY . /code
WORKDIR /code

RUN export DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC && \
    apt-get update && \
    apt-get upgrade && \
    apt-get install -y  \
      # basic python3 packages
      python3 python3-dev python3-pip   \
      # gui specific package to get GTK working
      python3-tk &&  \
    apt-get clean && \
    # clean up package detritus to keep image small
    rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install -r requirements.txt
CMD python3 -m laserGui