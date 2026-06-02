# Changelog

모든 주요 변경 사항을 이 파일에 기록합니다.
형식: [버전] - 날짜 / 배포자 / 상태

---

## [5.1.114] - 2026-06-01 / CI/CD Pipeline / deployed
### Changed
- `k8s/deployment.yaml` → `k8s/` 디렉토리로 이동
- `Dockerfile` + `requirements.txt` → `docker/` 디렉토리로 이동
- CI/CD 워크플로우 경로 업데이트
- `README.md` 아키텍처 다이어그램 및 배포 가이드 작성

## [5.1.113] - 2026-05-29 / CI/CD Pipeline / deployed
### Changed
- GitHub Actions Node.js 24 업그레이드 (v4 actions)
- 태그 트리거 패턴 수정 (`Cloud-Apps-UniyrL-*`)

## [5.1.112] - 2026-05-29 / CI/CD Pipeline / deployed
### Added
- Flask 앱 구조 추가 (`app/main.py`, `app/templates/`)
- nginx + ConfigMap 기반 서비스 상태 페이지 배포
- AWS Load Balancer (ALB) 서비스 구성

## [5.1.111] - 2026-03-02 / CI/CD Pipeline / deployed
### Fixed
- 서비스 응답 지연 이슈 수정 (hotfix)
- 안정화 패치 적용

## [5.1.110] - 2026-02-28 / CI/CD Pipeline / deployed
### Changed
- 응답 안정성 패치
- 버전 메타데이터 업데이트

## [5.1.109] - 2026-02-25 / CI/CD Pipeline / deployed
### Fixed
- 서비스 안정성 개선 패치

---

> 전체 버전 히스토리: [Tags 페이지](../../tags) 참조
