# VPC Lattice デモ環境

このリポジトリには、AWS VPC Lattice および PrivateLink のデモ環境を構築するための Terraform コードが含まれています。

## アーキテクチャ概要

このインフラストラクチャは、以下のコンポーネントで構成されています：

- **4つのVPC**:
  - Client-VPC (10.0.0.0/16): クライアントとなるVPC
  - On-premises-VPC (10.2.0.0/16): オンプレミス環境を模擬するVPC
  - Provider-VPC-Lattice (10.0.0.0/16): サービスプロバイダー側VPC（ECS、Lambda）
  - Provider-VPC-Resource (10.0.0.0/16): サービスプロバイダー側VPC（RDS）

- **VPC間接続**:
  - VPC Peering: Client-VPC と On-premises-VPC 間
  - VPC Lattice / PrivateLink: VPC Lattice および PrivateLink を通じた接続は手動で設定する必要があります

- **コンピューティングリソース**:
  - ECR: プライベートなコンテナレジストリ
  - ECS: ECRからイメージを取得するFargateサービス（プライベートサブネット内）
  - Lambda: シンプルなHTTPレスポンスを返す関数（プライベートサブネット内）
  - RDS: PostgreSQLデータベース（プライベートサブネット内）

- **VPCエンドポイント**:
  - S3 Gateway エンドポイント: コンテナイメージの保存用
  - ECR API エンドポイント: コンテナレジストリへのアクセス用
  - ECR Docker エンドポイント: Dockerイメージのプル用
  - CloudWatch Logs エンドポイント: ログ出力用

## デプロイ方法

### 前提条件

- Terraform >= 1.0.0
- AWS CLI がセットアップおよび認証済み

### Lattice PrivateLink以外の構築手順

1. リポジトリをクローン
```bash
git clone <repository-url>
cd VPC-Lattice-Demo/terraform
```

2. AWSプロファイルの作成
「~/.aws/credentials」に「vpc-lattice-demo」プロファイルを設定する


3. Terraform の初期化
```bash
terraform init
```

4. 実行計画の確認
```bash
terraform plan
```

5. 環境構築
```bash
terraform apply
```

## ECRイメージのプッシュ手順

デプロイ後、以下の手順でコンテナイメージをプッシュします：

```bash
# 1. ECRリポジトリ用のディレクトリに移動
cd modules/ecr

# 2. スクリプトに実行権限を付与
chmod +x push_image.sh

# 3. スクリプトを実行してDockerイメージをビルドしてプッシュ
./push_image.sh --profile vpc-lattice-demo
```

## VPC Lattice / PrivateLink の設定

技術ブログ本編を参照してください。
https://zenn.dev/nttdata_tech/articles/ed168dc2c1648e

## 検証方法

### ECS サービスへのアクセス

CloudShell から以下のコマンドを実行してください（VPC Lattice設定後）：

```bash
curl -v http://<VPC-Lattice-Service-Name>.<VPC-Lattice-Domain>
```

### Lambda 関数への呼び出し

CloudShell から以下のコマンドを実行してください（VPC Lattice設定後）：

```bash
curl -v http://<VPC-Lattice-Service-Name>.<VPC-Lattice-Domain>/lambda
```

### RDS への接続

CloudShell から以下のコマンドを実行してください（PrivateLink設定後）：

```bash
# パスワードの取得
aws ssm get-parameter --name <RDS-Password-SSM-Path> --with-decryption --query Parameter.Value --output text --profile vpc-lattice-demo

# PostgreSQL への接続
psql -h <RDS-PrivateLink-Endpoint> -U postgres -d postgres
```

## リソースの削除

すべてのリソースを削除するには、手動で作成したリソースを削除した後に以下のコマンドを実行します`：

```bash
terraform destroy -var-file=env/dev/terraform.tfvars
```

## 注意事項

- このコードはデモ目的のものであり、本番環境での使用は推奨されません。
- セキュリティグループは簡略化されており、本番環境では適切に設定する必要があります。
- 一部のリソース（マルチAZ構成のRDSなど）は、コストが発生する可能性があります。使用後は忘れずに削除してください。
