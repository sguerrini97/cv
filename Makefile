OUTPUT_DIRECTORY=out
SRC=main.tex

pdf:
	pdflatex --output-directory=${OUTPUT_DIRECTORY} ${SRC}

clean:
	rm -rfv ${OUTPUT_DIRECTORY}/*
