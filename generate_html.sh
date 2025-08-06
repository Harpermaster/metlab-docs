#!/bin/bash

# Папка с Markdown-файлами
MD_DIR="./docs/pmi-metlab"

# Цикл по всем .md файлам
for md_file in "$MD_DIR"/*.md; do
    # Получаем имя без расширения
    filename=$(basename "$md_file" .md)
    # Определяем путь к HTML
    html_file="$MD_DIR/${filename}.html"

    echo "📄 Генерация $html_file из $md_file..."
    
    # Генерация HTML
    pandoc "$md_file" -o "$html_file" --metadata title="Документация MeterLab" --css=https://cdn.jsdelivr.net/npm/water.css@2/out/water.css
done

echo "✅ Все HTML-файлы обновлены."
