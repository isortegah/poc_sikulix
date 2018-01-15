FROM isortegah/openjdk8:v1

RUN echo "Install requirements:" \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
        libopencv-core2.4v5 \
        libopencv-highgui2.4-deb0 \
        libtesseract3 \
        wmctrl \
        xdotool \
        xvfb \
        xauth \
 && apt-get clean 

RUN echo "Workaround lsb_release showing errors when missing:" \
 && printf "#/bin/sh\nuname -a\n" >/usr/bin/lsb_release \
 && chmod +x /usr/bin/lsb_release 

RUN apt-get install -y sikulix

RUN echo "Download and install SikuliX:" \
 && export DOWNLOAD_URL=$(curl -L https://launchpad.net/sikuli/sikulix/ | grep -Po '(?<=href=")https://launchpad.net/sikuli/sikulix/[^"]+download[^"]+') \
 && echo $DOWNLOAD_URL 
 
RUN mkdir /sikulix \
 && curl -L https://launchpad.net/sikuli/sikulix/1.1.1/+download/sikulixsetup-1.1.1.jar -o /sikulix/sikulix-setup.jar 

RUN xvfb-run java -jar /sikulix/sikulix-setup.jar options 1.1 

RUN echo "Make SikuliX binaries available for everyone:" \
 && chmod +x /sikulix/sikulix.jar /sikulix/runsikulix \
 && ln -s /sikulix/runsikulix /usr/local/bin/ \
 && ln -s /sikulix/sikulix.jar /usr/local/bin/ \
 && echo "Create default home directory:" \
 && mkdir /home/sikulix \
 && chmod ugo+rwx /home/sikulix \
 && echo "Clean-up:" \
 && rm -rf /var/lib/apt/lists/* /tmp/* /sikulix/sikulix-setup.jar /sikulix/*-SetupLog.txt /sikulix/SetupStuff
