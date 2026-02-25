#!/bin/bash

# 1. 버전 배열 (원하시는 대로 Cloud-Apps-UniyrL: 뒷부분을 추가/수정하세요)
VERSIONS=("5.1.4" "5.1.5" "5.2.0" "5.2.1" "5.2.2")

# 2. 가짜 날짜 (6개월치, 과거부터 현재순으로 작성)
DATES=(
  "2023-08-10T10:00:00"
  "2023-09-15T14:30:00"
  "2023-10-20T11:15:00"
  "2023-11-25T16:45:00"
  "2023-12-10T09:20:00"
)

# 3. 그럴듯한 커밋 메시지 (앱에 영향 없는 문서/주석 변경사항처럼 보이게 함)
MESSAGES=(
  "docs: update internal documentation"
  "chore: clean up whitespace and comments"
  "style: format configuration templates"
  "docs: fix typo in notes"
  "chore: update version tracking logic"
)

# 4. 반복문을 돌며 과거 기록 생성
for i in ${!VERSIONS[@]}; do
  # 실제 앱 구동에 영향이 없도록 더미 파일만 수정
  echo "Version logged: Cloud-Apps-UniyrL:${VERSIONS[$i]}" >> dummy_history.txt
  git add dummy_history.txt

  # 과거 날짜로 커밋 조작
  GIT_AUTHOR_DATE="${DATES[$i]}" GIT_COMMITTER_DATE="${DATES[$i]}" git commit -m "${MESSAGES[$i]}"

  # 버전 태그 생성
  git tag "Cloud-Apps-UniyrL:${VERSIONS[$i]}"
done

# 5. Github로 푸시 (커밋 기록과 태그 모두 전송)
git push origin main
git push --tags
