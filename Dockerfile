FROM selenium/standalone-chrome

ENV version 2.7.13

RUN sudo apt-get update
RUN sudo apt-get install -y software-properties-common curl xvfb

RUN sudo add-apt-repository -y ppa:fkrull/deadsnakes

RUN sudo apt-get update
RUN sudo apt-get install -y python2.7 python-pip

COPY wait-untill-selenium-ready.sh /opt/bin/wait-untill-selenium-ready
COPY run-selenium.sh /opt/bin/run-selenium

CMD /opt/bin/entry_point.sh &> /dev/null & \
    /opt/bin/wait-untill-selenium-ready.sh
