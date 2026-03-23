# 軽量なPython 3.10をベースにする
FROM python:3.10-slim

# 作業ディレクトリの設定
WORKDIR /app

# システムパッケージのアップデート（最低限必要なものだけ）
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# requirements.txt をコンテナ内にコピー
COPY requirements.txt .

# pipのアップグレードとライブラリのインストール
# --no-cache-dir をつけてコンテナの容量肥大化を防ぐ
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# デフォルトのコマンド (起動時はbashを開く)
CMD ["/bin/bash"]
