FROM ubuntu:17.10
MAINTAINER YunlongYang <yunlong17568@gmail.com>

# Download the source Code
# 1. repo
ADD https://mirrors.tuna.tsinghua.edu.cn/git/git-repo /usr/local/bin/repo
RUN chmod 755 /usr/local/bin/repo

# 2. update package source
RUN apt-get update

# 3. install tools for download source code
RUN apt-get install -y python
RUN apt-get install -y git

##### If you are in China, you should use mirron from mirrors.tuna.tsinghua.edu.cn.
##### ENV REPO_URL 'https://mirrors.tuna.tsinghua.edu.cn/git/git-repo/'

# 4. download source

# set git user.name & user.email
# git config --global user.email "you@example.com"
# git config --global user.name "Your Name"

# RUN repo init -u git://github.com/LineageOS/android.git -b lineage-15.0

##### If you are in China, you should use mirron from mirrors.tuna.tsinghua.edu.cn.
##### repo init -u https://mirrors.tuna.tsinghua.edu.cn/git/lineageOS/LineageOS/android.git -b lineage-15.0
##### After do this, you have to change some urls in '.repo/mainfest.xml'
##### <remote  name="github"
#####           fetch=".."
##### <remote  name="github"
#####           fetch="https://mirrors.tuna.tsinghua.edu.cn/git/lineageOS/"
#####
##### <remote  name="aosp"
#####           fetch="https://android.googlesource.com"
##### 
#####   <remote  name="aosp"
#####
#####           fetch="https://aosp.tuna.tsinghua.edu.cn"
#####
#####

# RUN repo sync


# 6. prepare compile env
RUN apt-get install -y curl
RUN apt-get install -y make
RUN apt-get install -y adb
RUN apt-get install -y ccache
RUN apt-get install -y openjdk-8-jdk
RUN apt-get install -y bc 
RUN apt-get install -y bison 
RUN apt-get install -y build-essential 
RUN apt-get install -y flex 
RUN apt-get install -y g++-multilib 
RUN apt-get install -y gcc-multilib
RUN apt-get install -y gnupg
RUN apt-get install -y gperf
RUN apt-get install -y imagemagick
RUN apt-get install -y lib32ncurses5-dev
RUN apt-get install -y lib32readline-dev
RUN apt-get install -y lib32z1-dev
RUN apt-get install -y libesd0-dev
RUN apt-get install -y liblz4-tool
RUN apt-get install -y libncurses5-dev
RUN apt-get install -y libsdl1.2-dev
RUN apt-get install -y libssl-dev
RUN apt-get install -y libwxgtk3.0-dev
RUN apt-get install -y libxml2
RUN apt-get install -y libxml2-utils
RUN apt-get install -y lzop
RUN apt-get install -y pngcrush
RUN apt-get install -y rsync
RUN apt-get install -y schedtool
RUN apt-get install -y squashfs-tools
RUN apt-get install -y xsltproc
RUN apt-get install -y zip
RUN apt-get install -y zlib1g-dev

# 7. ENV for compile
ENV USER=lineageos\
 ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G"\
 USE_CCACHE=1 CCACHE_COMPRESS=1
