#!/bin/bash
# creates compiled monster PDFs (letter/A4) and booklets, then lulu-ready PDF, then monster cards (PNG) and PDFs (Letter/A4)
sh /home/yochai/github/cairn/scripts/build-bestiary-letter.sh
sh /home/yochai/github/cairn/scripts/build-bestiary-a4.sh
sh /home/yochai/github/cairn/scripts/build-bestiary-a5.sh
sh /home/yochai/github/cairn/scripts/build-bestiary-statement.sh
sh /home/yochai/github/cairn/scripts/build-bestiary-lulu.sh
python3 /home/yochai/github/cairn/scripts/build-bestiary-cards-images.py
sh /home/yochai/github/cairn/scripts/build-bestiary-cards-pdf.sh