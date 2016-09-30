FROM ubuntu:16.04

RUN export DEBIAN_FRONTEND=noninteractive; \
    apt-get update && \
    apt-get install -y gettext expect && \
    apt-get install -y build-essential && \
    apt-get install -y git wget && \
    apt-get install -y libssl-dev libreadline-dev zlib1g-dev && \
    apt-get install -y sudo && \
    apt-get install -y ruby && \
    apt-get install -y subversion && \
    apt-get install -y ruby-dev && \
    apt-get install -y nano && \
    apt-get install -y openssh-server gccxml && \
    apt-get install -y autoconf automake avahi-daemon castxml cmake freeglut3-dev gazebo7 gazebo7-plugin-base gobject-introspection graphviz graphviz-dev gstreamer0.10-plugins-good gtk-doc-tools libatlas-base-dev libavahi-client-dev libavahi-client3 libavahi-core-dev libboost-dev libboost-filesystem-dev libboost-graph-dev libboost-iostreams-dev libboost-program-options-dev libboost-regex-dev libboost-system-dev libboost-thread-dev libfftw3-dev libgazebo7-dev libgdal1-dev libgoogle-glog-dev libgps-dev libgstreamer-plugins-base0.10-dev libgstreamer0.10-dev libgtk2.0-dev libjpeg-dev liblapack-dev libomniorb4-dev libopencv-dev libopenscenegraph-dev libpcre3-dev libpoco-dev libprocps4-dev libproj-dev libqt4-dev libqt4-opengl-dev libqtwebkit-dev libqwt5-qt4-dev libsdformat4-dev libsigc++-2.0-0v5 libsigc++-2.0-dev libsuitesparse-dev libsysfs-dev libtinyxml-dev libudev-dev libusb-1.0-0-dev libusb-dev libv4l-dev libvtk5-dev libvtk5-qt4-dev libxml-xpath-perl libxml2-dev omniidl omniorb-nameserver openscenegraph pkg-config qt4-designer qt4-qmake ruby-activesupport ruby-thor && \
    apt-get install -y doxygen && \
    apt-get install -y protobuf-compiler && \
    apt-get install -y lib32stdc++6 && \
    apt-get install -y python-protobuf && \
    apt-get install -y libyaml-cpp-dev && \
    apt-get install -y libhidapi-dev && \
    apt-get install -y openocd p7zip gcc-arm-none-eabi gdb-arm-none-eabi && \
    apt-get clean && \
    rm -rf /tmp/* /var/tmp/*

RUN export LANGUAGE=en_US.UTF-8; \
    export LANG=en_US.UTF-8; \
    export LC_ALL=en_US.UTF-8; \
    locale-gen en_US.UTF-8; \
    DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales

# Set locales
ENV LANGUAGE=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

COPY install-flatfish.sh /usr/local/bin/install-flatfish
RUN chmod 755 /usr/local/bin/install-flatfish

CMD ["/usr/sbin/sshd", "-D"]
