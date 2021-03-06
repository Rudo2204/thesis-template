#!/usr/bin/env sh
# Originally from https://github.com/latex3/latex3

# See if there is a cached version of TL available
export PATH=/tmp/texlive/bin/x86_64-linux:$PATH
if ! command -v texlua > /dev/null; then
  # Obtain TeX Live
  wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
  tar -xzf install-tl-unx.tar.gz
  cd install-tl-20*

  # Install a minimal system
  ./install-tl --profile=../ci/texlive/texlive.profile

  cd ..
fi

# Just including texlua so the cache check above works
# Needed for any use of texlua even if not testing LuaTeX
tlmgr install luatex

# Other contrib packages: done as a block to avoid multiple calls to tlmgr
# We specify the directory in which it is located texlive_packages
tlmgr install $(sed 's/\s*#.*//;/^\s*$/d' ci/texlive/texlive_packages)

# Can also just specify like the following
# texlive-latex-base is needed to run pdflatex
#tlmgr install   \
#  exam          \
#  amsfonts      \
#  stmaryrd      \
#  amsmath

# Keep no backups (not required, simply makes cache bigger)
tlmgr option -- autobackup 0

# Update the TL install but add nothing new
tlmgr update --self --all --no-auto-install