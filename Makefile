OUTPUT_DIRECTORY=out
SRC=main.tex

all: pdf

pdf: out/
	pdflatex --output-directory=${OUTPUT_DIRECTORY} ${SRC}

out/:
	mkdir out

clean:
	rm -rfv ${OUTPUT_DIRECTORY}/*
