OUTPUT_DIRECTORY=out
SRC=main.tex

.PHONY: all pdf clean test

all: pdf

pdf: out/
	pdflatex --output-directory=${OUTPUT_DIRECTORY} ${SRC}

out/:
	mkdir out

test:
	bash tests/cv-source-contract.sh

clean:
	rm -rfv ${OUTPUT_DIRECTORY}/*
