all: pdf
	rm -f *.aux *.log *.bbl *.blg *.toc *.lof *.lot *.out
	rm -f head/*.aux head/*.log
	rm -f main/*.aux main/*.log
	rm -f tail/*.aux tail/*.log

pdf: clean
	pdflatex my_thesis
	bibtex my_thesis
	pdflatex my_thesis
	pdflatex my_thesis
	pdflatex my_thesis

clean:
	rm -f *.aux *.log *.bbl *.blg *.toc *.lof *.lot *.out
	rm -f head/*.aux head/*.log
	rm -f main/*.aux main/*.log
	rm -f tail/*.aux tail/*.log
ifeq ($(wildcard my_thesis.pdf),)
else
	rm my_thesis.pdf
endif 
view: all
	zathura my_thesis.pdf
