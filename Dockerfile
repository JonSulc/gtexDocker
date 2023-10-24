FROM python:3.11.3-bullseye

RUN apt-get update && apt-get install -y
RUN apt-get install -y python3-pip
RUN pip3 install --upgrade pip
RUN pip3 install pandas tensorqtl
RUN pip3 install Cython
RUN git clone https://github.com/clibs/clib.git /tmp/clib && cd /tmp/clib  && make install && cd
RUN wget https://github.com/chrchang/plink-ng/archive/refs/tags/v2.00a4-final.tar.gz
RUN tar -xvf v2.00a4-final.tar.gz
RUN apt-get install libblas-dev liblapack-dev libblas-dev libatlas-base-dev -y
RUN cd plink-ng-2.00a4-final/2.0 && make -j && make install
