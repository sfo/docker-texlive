# docker-texlive
A docker image that provides a full TeX Live installation.

## Use

```bash
docker run --rm -it -v $(pwd):/tex -u $(id -u):$(id -g) ksfo/texlive:latest xelatex helloworld.tex
```
