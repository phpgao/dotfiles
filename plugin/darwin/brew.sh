#!/usr/bin/env bash

# brew install zsh-syntax-highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# brew install zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

plugins=(git
	gitfast
	last-working-dir
	common-aliases
	history-substring-search
	kubectl
	docker-compose
	timer
	gitignore
    minikube
    extract
)
