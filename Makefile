OUTPUT_DIRECTORY=out
SRC=main.tex

.PHONY: all pdf clean test

all: pdf

pdf: out/
	pdflatex --output-directory=${OUTPUT_DIRECTORY} ${SRC}

out/:
	mkdir out

test: pdf
	bash tests/cv-source-contract.sh
	pdfinfo ${OUTPUT_DIRECTORY}/main.pdf | grep -Eq '^Pages:[[:space:]]+1$$'

clean:
	rm -rfv ${OUTPUT_DIRECTORY}/*
