# Code Plant
植物と工場の意味が掛かっています!
## 前提条件

- Linuxサーバー（Ubuntuを推奨）
- Docker
- Docker Compose
- NVIDIA GPU（推奨）
- NVIDIA Container Toolkit

## セットアップ手順

### 1. リポジトリをクローン

```bash
git clone https://github.com/tkm427/code-plant.git
cd code-plant
```

### 2. 設定

#### ダウンロードするモデルを指定

`config/models.txt`にダウンロードしたいモデルを1行に1つずつ記述します：

```
llama3
gemma:7b
mistral
phi3
```
> [!CAUTION]
> 現在自動でモデルをダウンロードできていません。なのでdocker-compose起動後に以下を実行

```bash
docker-compose exec ollama bash
ollama run [モデル名]
```

### 3. 起動

```bash
docker-compose up -d
```


### 4. 接続

- OpenHandsインターフェース: `http://[サーバーのIPアドレス]:3000`

### 5. OpenHandsの設定
<img width="1125" alt="Image" src="https://github.com/user-attachments/assets/7e855357-2041-42d8-be99-f86e9a55b4e9" />
## ファイル構成

- `docker-compose.yml`: Docker Compose設定ファイル
- `scripts/init.sh`: モデル自動ダウンロードスクリプト
- `config/models.txt`: ダウンロードするモデルのリスト

