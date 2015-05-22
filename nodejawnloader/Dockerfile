# Pull base image.
FROM ubuntu:14.04

RUN apt-get update && apt-get install -y \
  ruby-dev \
  build-essential \
  git \
  mercurial \
  subversion

RUN apt-get install -y wget

RUN gem install compass

# Install Node.js
RUN \
  cd /tmp && \
  wget http://nodejs.org/dist/node-latest.tar.gz && \
  tar xvzf node-latest.tar.gz && \
  rm -f node-latest.tar.gz && \
  cd node-v* && \
  ./configure && \
  CXX="g++ -Wno-unused-local-typedefs" make && \
  CXX="g++ -Wno-unused-local-typedefs" make install && \
  cd /tmp && \
  rm -rf /tmp/node-v* && \
  npm install -g npm && \
  printf '\n# Node.js\nexport PATH="node_modules/.bin:$PATH"' >> /root/.bashrc

# Define working directory.

RUN npm install -g bower
RUN npm install -g grunt-cli

RUN git clone https://github.com/xblaster/Nodjawnloader.git working

WORKDIR working

RUN npm install

RUN git pull

EXPOSE 3033

WORKDIR src

# Define default command.
CMD ["node", "app.js"]
