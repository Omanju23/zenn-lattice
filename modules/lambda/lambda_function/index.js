exports.handler = async (event) => {
  // 受け取ったイベント全体を確認
  console.log('Event received:', JSON.stringify(event));

  // 単一値ヘッダを出力
  if (event.headers) {
    console.log('Headers received:', JSON.stringify(event.headers));
  } else {
    console.log('No single-value headers in event.headers');
  }

  // 複数値ヘッダを出力 (必要に応じて)
  if (event.multiValueHeaders) {
    console.log('Multi-value headers received:', JSON.stringify(event.multiValueHeaders));
  } else {
    console.log('No multi-value headers in event.multiValueHeaders');
  }

  const response = {
    statusCode: 200,
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      message: 'Hello from Lambda in VPC Lattice demo!',
      timestamp: new Date().toISOString()
    })
  };

  return response;
};
