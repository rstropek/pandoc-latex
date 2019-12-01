FROM pandoc/latex
RUN apk update \
    && apk add texlive-full
ENV PATH $PATH:/opt/texlive/texdir/bin/x86_64-linux
RUN tlmgr update --self
RUN tlmgr install \
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
    pdftexcmds
