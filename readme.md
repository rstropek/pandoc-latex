# Pandoc LaTeX with Eisvogel

## Introduction

*Pandoc* has an official Docker image [*pandoc/latex*](https://hub.docker.com/r/pandoc/latex). I like to use the [*Eisvogel* LaTeX template](https://github.com/Wandmalfarbe/pandoc-latex-template). Unfortunately, you cannot build PDFs from Markdown using this template with *pandoc/latex*. Some packages from *TeX Live* are missing.

Therefore, I created a Docker image based on [*pandoc/latex*](https://hub.docker.com/r/pandoc/latex) that can build PDFs using *Eisvogel*.

## Usage

The following `docker run` statement will generate *mydoc.pdf* from the markdown file *mydoc.md* with the [YAML metadata](https://pandoc.org/MANUAL.html#extension-yaml_metadata_block) in *mydoc.yaml*. Try to run the statement inside the *example* folder.

### Linux

```
docker run --rm -v `pwd`:/data -w /data  rstropek/pandoc-latex -f markdown \
    --template https://rawcdn.githack.com/Wandmalfarbe/pandoc-latex-template/e6c05b46a358519eb07cbbec354797efd8fde9e2/eisvogel.tex \
    -t latex \
    -o mydoc.pdf \
    --metadata-file=mydoc.yaml \
    mydoc.md
```

### Windows

```
docker run --rm -v %cd%:/data -w /data  rstropek/pandoc-latex -f markdown ^
    --template https://rawcdn.githack.com/Wandmalfarbe/pandoc-latex-template/e6c05b46a358519eb07cbbec354797efd8fde9e2/eisvogel.tex ^
    -t latex ^
    -o mydoc.pdf ^
    --metadata-file=mydoc.yaml ^
    mydoc.md
```
