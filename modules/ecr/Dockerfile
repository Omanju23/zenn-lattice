FROM node:18-alpine
WORKDIR /usr/src/app
# 依存関係ファイルをコピー
COPY package*.json ./
# 依存関係をインストール
RUN npm install
# アプリケーションのソースをコピー
COPY server.js /usr/src/app/
# ポート80を公開
EXPOSE 80
# アプリケーションを実行
CMD ["node", "server.js"]
