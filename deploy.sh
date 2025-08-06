#!/bin/bash

set -e  # Остановить при ошибке

# === 1. Генерация HTML из всех md-файлов ===
echo "🛠️ Генерация HTML из Markdown..."
for md_file in docs/pmi-metlab/*.md; do
    html_file="${md_file%.md}.html"
    pandoc "$md_file" -o "$html_file" --from markdown --to html5 \
        --css=https://cdn.jsdelivr.net/npm/water.css@2/out/water.css \
        --metadata title="MeterLab" \
        --standalone
    echo "✔️  $md_file → $html_file"
done

# === 2. Сохраняем текущую ветку ===
CURRENT_BRANCH=$(git branch --show-current)

echo "🔁 Переключаюсь на ветку v1-metlab..."
git checkout v1-metlab

echo "📥 Мержу изменения из main..."
git merge main --no-edit

# === 3. Добавление и коммит .html файлов ===
echo "📁 Добавляю HTML-файлы..."
git add docs/pmi-metlab/*.html

echo "💾 Коммит изменений..."
git commit -m "🚀 Автогенерация HTML из Markdown и обновление ветки v1-metlab" || echo "ℹ️ Нет изменений для коммита"

# === 4. Публикация ===
echo "📤 Публикую на GitHub Pages..."
git push origin v1-metlab

echo "🔄 Возвращаюсь на ветку $CURRENT_BRANCH..."
git checkout "$CURRENT_BRANCH"

echo "✅ Готово. Обновлённая версия сайта опубликована."

