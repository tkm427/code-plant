#!/bin/bash
set -e

# OllamaサーバーがAPIリクエストを受け付けるまで待機
echo "Waiting for Ollama service to be ready..."
while ! curl -s http://ollama:11434/api/tags >/dev/null; do
  sleep 2
done

# 設定ファイルからモデルリストを読み込む
CONFIG_FILE="/config/models.txt"
if [ -f "$CONFIG_FILE" ]; then
  while IFS= read -r MODEL || [ -n "$MODEL" ]; do
    # 空行とコメント行をスキップ
    [[ -z "$MODEL" || "$MODEL" =~ ^#.* ]] && continue
    
    echo "Pulling model: $MODEL"
    curl -X POST http://ollama:11434/api/pull -d "{\"name\": \"$MODEL\"}"
  done < "$CONFIG_FILE"
else
  echo "Model configuration file not found. Using default models."
  # デフォルトモデル
  DEFAULT_MODELS=("llama2")
  for MODEL in "${DEFAULT_MODELS[@]}"; do
    echo "Pulling model: $MODEL"
    curl -X POST http://ollama:11434/api/pull -d "{\"name\": \"$MODEL\"}"
  done
fi

echo "All models downloaded successfully!"