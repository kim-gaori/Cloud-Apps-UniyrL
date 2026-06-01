# Cloud-Apps-UniyrL · Service A

> AWS EKS 기반 서비스 상태 모니터링 애플리케이션

---

## Architecture

```
Developer (Dev EC2)
    │
    ├─ git commit & git tag Cloud-Apps-UniyrL-x.x.x
    │
    ▼
GitHub Repository
    │
    ├─ Tag push → GitHub Actions 자동 트리거
    │
    ▼
Amazon EKS  (cloud-app-cluster · ap-northeast-2)
    │
    ├─ kubectl apply -f deployment.yaml
    │
    ▼
AWS Load Balancer → Service A Pod (nginx)
```

---

## Environments

| 환경 | 인프라 | 용도 |
|------|--------|------|
| **Dev** | EC2 (dev-ec2) | 코드 개발 · 단위 테스트 |
| **Prod** | EKS · t3.medium × 2 | 프로덕션 서비스 운영 |

---

## CI/CD Pipeline

태그를 push하면 GitHub Actions가 자동으로 EKS에 배포합니다.

```bash
# 새 버전 배포
git tag Cloud-Apps-UniyrL-5.1.114
git push origin Cloud-Apps-UniyrL-5.1.114
```

트리거 패턴: `Cloud-Apps-UniyrL-*`

---

## Application

### Endpoints

| Method | Path | Description |
|--------|------|-------------|
| GET | `/` | 서비스 상태 페이지 |
| GET | `/health` | 헬스체크 (JSON) |

### Health Response

```json
{
  "status": "healthy",
  "service": "service-a",
  "version": "5.1.113"
}
```

---

## Local Development

```bash
# 의존성 설치
pip install -r requirements.txt

# 로컬 실행
python app/main.py
# → http://localhost:5000
```

## Docker

```bash
docker build -t service-a:5.1.113 .
docker run -p 5000:5000 -e APP_VERSION=5.1.113 service-a:5.1.113
```

---

## Infrastructure

| 항목 | 값 |
|------|-----|
| Region | ap-northeast-2 (Seoul) |
| Cluster | cloud-app-cluster |
| K8s Version | 1.34 |
| Node Type | t3.medium × 2 |
| Auth Mode | API_AND_CONFIG_MAP |
