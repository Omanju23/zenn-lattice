const express = require('express');
const app = express();
const port = 80;

// JSONボディパーサーを設定
app.use(express.json());

// すべてのリクエストに対して応答するルート
app.all('*', (req, res) => {
  // リクエストのヘッダーを取得
  const headers = req.headers;
  
  // ヘッダーをログに出力
  console.log('Headers received:', JSON.stringify(headers));

  // レスポンスにヘッダー情報を含める
  res.json({
    message: 'Hello from ECS in VPC Lattice demo!',
    timestamp: new Date().toISOString(),
    headers: headers
  });
});

// サーバーを起動
app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});