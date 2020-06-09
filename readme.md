# Pandoc LaTeX with Eisvogel


## Introduction

*Pandoc* has an official Docker image [*pandoc/latex*](https://hub.docker.com/r/pandoc/latex). I like to use the [*Eisvogel* LaTeX template](https://github.com/Wandmalfarbe/pandoc-latex-template). Unfortunately, you cannot build PDFs from Markdown using this template with *pandoc/latex*. Some packages from *TeX Live* are missing.

Therefore, I created a Docker image based on [*pandoc/latex*](https://hub.docker.com/r/pandoc/latex) that can build PDFs using *Eisvogel*. You can find it on *Docker Hub* under [*rstropek/pandoc-latex*](https://hub.docker.com/r/rstropek/pandoc-latex).


## Examples

The [*examples*](examples) folder contains an example document (markdown content, YAML metadata) including the generated PDF document.


## Usage

The following `docker run` statement will generate *mydoc.pdf* from the markdown file *mydoc.md* with the [YAML metadata](https://pandoc.org/MANUAL.html#extension-yaml_metadata_block) in *mydoc.yaml*. Try to run the statement inside the *example* folder.

Several optional packages, mentioned by [*pandoc/latex*](https://hub.docker.com/r/pandoc/latex), are preinstalled in the image.  
That includes **sectsty**, for those who want to add line breaks before chapters without using the **book** property.
See [this issue](https://github.com/Wandmalfarbe/pandoc-latex-template/issues/81) for more details.

### Supported Versions

Tested with [*Eisvogel* LaTeX template](https://github.com/Wandmalfarbe/pandoc-latex-template) 1.4.0.

### Linux

```bash
docker run --rm \
    -v `pwd`:/data \
    -w /data \
    rstropek/pandoc-latex \
    -f markdown \
    --template https://raw.githubusercontent.com/Wandmalfarbe/pandoc-latex-template/v1.4.0/eisvogel.tex \
    -t latex \
    -o mydoc.pdf \
    --metadata-file=mydoc.yaml \
    mydoc.md
```

### Windows

```bash
docker run --rm ^
    -v %cd%:/data ^
    -w /data ^
    rstropek/pandoc-latex ^
    -f markdown ^
    --template https://raw.githubusercontent.com/Wandmalfarbe/pandoc-latex-template/v1.4.0/eisvogel.tex ^
    -t latex ^
    -o mydoc.pdf ^
    --metadata-file=mydoc.yaml ^
    mydoc.md
```


## Development

### Build

```bash
# Use a significative tag
# (e.g. here, follow the version of pandoc/latex used as the basis in the Dockerfile).
docker build -t rstropek/pandoc-latex:2.9.1.1 .
```

### Tests

Make sure you have [BATS](https://github.com/bats-core/bats-core) installed.

```bash
bats tests
```

