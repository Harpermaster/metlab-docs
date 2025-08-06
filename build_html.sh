#!/bin/bash

echo "Генерация HTML-файлов..."

pandoc docs/pmi-metlab/01_intro.md -o docs/pmi-metlab/01_intro.html --css=https://cdn.jsdelivr.net/npm/water.css@2/out/water.css --metadata title="Введение"
pandoc docs/pmi-metlab/02_equipment.md -o docs/pmi-metlab/02_equipment.html --css=https://cdn.jsdelivr.net/npm/water.css@2/out/water.css --metadata title="Оборудование"
pandoc docs/pmi-metlab/03_tests.md -o docs/pmi-metlab/03_tests.html --css=https://cdn.jsdelivr.net/npm/water.css@2/out/water.css --metadata title="Испытания"
pandoc docs/pmi-metlab/04_results.md -o docs/pmi-metlab/04_results.html --css=https://cdn.jsdelivr.net/npm/water.css@2/out/water.css --metadata title="Результаты"

echo "Готово!"


