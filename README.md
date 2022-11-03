# 개인프로젝트 -TimeCalculator
### 소현수(쏘롱)

## 뷰 구성 정보 및 기능

### 첫번째 페이지 - MainViewController
- 화면 구성
  - CalculatorView
    - CalculatorView로 계산기의 숫자표현
    - AC를 눌렸을때 숫자를 초기화해준다.
    - 왼쪽 square.fill 버튼을 눌렸을때 UserDefault에 저장된 값을 보여준다.
    - 오른쪽 gearshape 버튼을 눌렸을때 환경설정(SettingView로 화면전환) 

  - UesrDefaultView 
    -  왼쪽 휴지통버튼을 눌렸을떄 UserDefault 삭제할지 선택해주는 팝업창 기능구현
    -  오른쪽 x버튼을 눌렸을때 UesrDefaultView 숨김 기능구현

### 두번째 페이지 - SettingViewController
- 화면 구성
  - TableView로 3개의 섹션구현
  - 스위치로 다크모드,라이트모드 선택 기능 구현
  - UserDefault로 앱이 종료시 종료될떄의 화면모드로 실행

