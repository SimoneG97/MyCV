#!/usr/bin/env bash
typst compile --font-path ./assets/fonts resume.typ resume.pdf "$@"
