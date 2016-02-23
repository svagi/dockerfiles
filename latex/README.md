
# LaTeX / XeLaTeX

[![](https://badge.imagelayers.io/svagi/latex:latest.svg)](https://imagelayers.io/?images=svagi/latex:latest)

## Usage
```sh
docker run --rm -it -v $(pwd):/tmp -w /tmp svagi/latex xelatex $filename
```
## Use case tip
Create bash function
```sh
latex() {
	docker run --rm -it -v $(pwd):/tmp -w /tmp svagi/latex xelatex "$@"
}
```
then use it like this
```sh
latex $filename
```
