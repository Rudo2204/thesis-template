# thesis-template
> Hey, my thesis actually looks somewhat decent!

Github Actions: ![Build document](https://github.com/Rudo2204/thesis-template/workflows/Build%20document/badge.svg?branch=master)\
Travis CI Build: [![Build Status](https://travis-ci.com/Rudo2204/thesis-template.svg?branch=master)](https://travis-ci.com/Rudo2204/thesis-template)\
License: [![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

My LaTeX template for writing theses or reports.\
The style is heavily based on [my school's official writing guidelines for theses](http://doe.dee.hcmut.edu.vn/vi/bieu-mau/). Can be easily adapted for other purposes.

## Main Features:
- Make use of most common packages used to write theses in my field (embedded programming in this particular document).
- Consistent frontpage, can be easily rewrite for group projects with multiple contributors.
- Vacant pages
- Most common front matter material such as: abstract, declaration, thanks, table of contents, table of figures, list of tables, ect.
- Code highlighting with `minted` package.
- Bibliography handled by `biber` (best practice) with IEEE style.
- Appendices for source code, additional information, ect.
- Automatically compile and build the LaTeX document and then deploy to Github Release page.

## Requirements
If you want to use Travis CI you will need:
- A [Travis CI](https://travis-ci.com/) account (free for open sourced repos)
- Your repo must be accessible by Travis CI.

## How-to
### Test build the document locally
1. Install the latex packages: `texlive-latex-extra texlive-science texlive-lang-other biber latexmk texlive-bibtex-extra python3-pygments`
2. Compile them with `latexmk -pdf -shell-escape -bibtex -synctex=1 -interaction=nonstopmode main.tex`

**NOTE**: It may not compile the first time because of missing `dirtree.tex` error. If that is the case, compile interactively with `latexmk -pdf -shell-escape -bibtex -synctex=1 main.tex`, when it hits the error type `./custom_package/dirtree/dirtree`. Repeat until it comiles for the first time. Then after that you will be able to compile using `nonstopmode`.
### Use this template
1. Fork or clone the repo and rewrite the thesis contents.
2. Edit the information in the CI files marked with `TODO`, they will tell you what and how you edit them.
3. Commit changes and push to github to kick off a `master` branch build to see if anything goes wrong.
4. Generate an **annotated** tag to kick off build and deploy process with `git tag -a $TAG` and `git push origin $TAG`.

### Deploy options
There are two options you can choose to deploy your built artifacts to Github release page of the repo.
By default, this repo uses the first method of using Github Action to deploy artifacts.

1. Github Action
If you choose to use Github Action, you can just delete `.travis.yml` file to completely disable building/deploying on Travis.\
Or as a more elegant solution, just disable deploying feature of Travis. You can do this by chaging `deploy.on.condition` in `.travis.yml` file to be always false like this. (This is the default behavior in this repo)
```.travis.yml
deploy:
  on:
    condition: $DEPLOY = never
```

2. Travis CI
If you choose to use Travis CI to deploy the artifact, you will need to delete that `condition: $DEPLOY = never` line in `.travis.yml` to enable deploying feature.
Then, you will also need to disable deploy workflow from Github Action by deleting the `.github/workflows/deploy.yml`.

## Contribution
[Create new issue](https://github.com/Rudo2204/thesis-template/issues) if you have any ideas.\
Pull requests are welcomed.
