ARG LATEX_IMAGE_TAG=latest
FROM pandoc/latex:$LATEX_IMAGE_TAG

ENV PLANTUML_VERSION 1.2022.7

RUN apk add --no-cache \
    py3-pip \ 
    openjdk17-jre \
    graphviz \
    chromium \
    nodejs \
    npm 

RUN wget "http://downloads.sourceforge.net/project/plantuml/${PLANTUML_VERSION}/plantuml.${PLANTUML_VERSION}.jar" -O /usr/bin/plantuml.jar \
  && printf '#!/bin/sh\njava -jar /usr/bin/plantuml.jar $@' > /usr/bin/plantuml \
  && chmod +x /usr/bin/plantuml

ENV PLANTUML_BIN="/usr/bin/plantuml"

RUN pip install --no-cache-dir --upgrade pip \
  && pip install --no-cache-dir pandoc-plantuml-filter 

RUN npm install --global mermaid-filter 

## Do not use puppeteer embedded chromium
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD="true"
ENV CHROMIUM_PATH="/usr/bin/chromium-browser"
ENV PUPPETEER_EXECUTABLE_PATH="${CHROMIUM_PATH}"

ENV MERMAID_BIN=/usr/local/bin/mmdc

RUN tlmgr list
RUN tlmgr update --self && \
    tlmgr install \
    merriweather \
    fontaxes \
    mweights \
    mdframed \
    needspace \
    sourcesanspro \
    sourcecodepro \
    titling \
    ly1 \
    pagecolor \
    adjustbox \
    collectbox \
    titlesec \
    fvextra \
    pdftexcmds \
    footnotebackref \
    zref \
    fontawesome5 \
    footmisc \
    sectsty \
    koma-script \
    lineno \
    awesomebox \
    background \
    everypage \
    xurl \
    epstopdf
