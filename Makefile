# Define the shell to ensure consistency
SHELL := /bin/bash

# Count the words
# 1. Create isle.dat
results/isles.dat: data/isles.txt scripts/wordcount.py
	python scripts/wordcount.py --input_file=data/isles.txt --output_file=results/isles.dat

# 2. Create abyss.dat
results/abyss.dat: data/abyss.txt scripts/wordcount.py
	python scripts/wordcount.py --input_file=data/abyss.txt --output_file=results/abyss.dat

# 3. Create last.dat
results/last.dat: data/last.txt scripts/wordcount.py
	python scripts/wordcount.py --input_file=data/last.txt --output_file=results/last.dat

# 4. Create sierra.dat
results/sierra.dat: data/sierra.txt scripts/wordcount.py
	python scripts/wordcount.py --input_file=data/sierra.txt --output_file=results/sierra.dat

# Create the plots
# 1. Create isles.png
results/figure/isles.png: results/isles.dat scripts/plotcount.py
	python scripts/plotcount.py --input_file=results/isles.dat --output_file=results/figure/isles.png

# 2. Create abyss.png
results/figure/abyss.png: results/abyss.dat scripts/plotcount.py
	python scripts/plotcount.py --input_file=results/abyss.dat --output_file=results/figure/abyss.png

# 3. Create last.png
results/figure/last.png: results/last.dat scripts/plotcount.py
	python scripts/plotcount.py --input_file=results/last.dat --output_file=results/figure/last.png

# 4. Create sierra.png
results/figure/sierra.png: results/sierra.dat scripts/plotcount.py
	python scripts/plotcount.py --input_file=results/sierra.dat --output_file=results/figure/sierra.png

.PHONY: report
report:
	quarto render report/count_report.qmd

.PHONY: all
all:
# Count the words
	python scripts/wordcount.py --input_file=data/isles.txt --output_file=results/isles.dat
	python scripts/wordcount.py --input_file=data/abyss.txt --output_file=results/abyss.dat
	python scripts/wordcount.py --input_file=data/last.txt --output_file=results/last.dat
	python scripts/wordcount.py --input_file=data/sierra.txt --output_file=results/sierra.dat
# Create the plots
	python scripts/plotcount.py --input_file=results/isles.dat --output_file=results/figure/isles.png
	python scripts/plotcount.py --input_file=results/abyss.dat --output_file=results/figure/abyss.png
	python scripts/plotcount.py --input_file=results/last.dat --output_file=results/figure/last.png
	python scripts/plotcount.py --input_file=results/sierra.dat --output_file=results/figure/sierra.png
# Write the report
	quarto render report/count_report.qmd

.PHONY: clean
clean:
	rm -f results/isles.dat
	rm -f results/abyss.dat
	rm -f results/last.dat
	rm -f results/sierra.dat
	rm -f results/figure/isles.png
	rm -f results/figure/abyss.png
	rm -f results/figure/last.png
	rm -f results/figure/sierra.png
	rm -f report/count_report.html
	rm -r report/count_report_files/