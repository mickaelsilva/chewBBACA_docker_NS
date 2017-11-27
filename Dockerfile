#USE BLAST BINARIES FROM UMMIDOCK REPO 
FROM ummidock/blast_binaries:2.6.0-binaries 
WORKDIR /NGStools/
RUN apt-get update
RUN apt-get install psmisc
#RUN apt-get install -y git make python-dev gcc wget libxml2-dev libxslt1-dev zlib1g-dev g++ build-essential
RUN apt-get install -y git make python python-dev libatlas-base-dev python3 wget g++ build-essential
# python3-numpy python3-scipy
RUN which pip3
RUN python3 -m pip install --upgrade pip
#GET chewBBACA and Prodigal 
RUN git clone https://github.com/hyattpd/Prodigal.git
RUN git clone -b chewie_NS https://github.com/B-UMMI/chewBBACA.git
#INSTALL chewBBACA requirements 
WORKDIR /NGStools/chewBBACA
RUN pip3 install -U -r requirements.txt
#RUN pip3 install --upgrade numpy
#INSTALL PRODIGAL 
WORKDIR /NGStools/Prodigal
RUN make install
WORKDIR /NGStools/
#ADD chewBBACA TO PATH 
ENV PATH="/NGStools/chewBBACA:${PATH}"
ENV PATH="/NGStools/chewBBACA/utils/:$PATH"
