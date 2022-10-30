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

### 프로젝트 후기 및 고찰
-  기능을 구현하지 못한 부분: UesrDefaultView에서 tableView로 만들었는데  여기서 32 + 21 = 53 이라는 식을 보여주지 못함.
-  UserDefaultsValue 값 삭제시 테이블뷰에는 0으로 표현이 되지만 셀의갯수는변하지않음.
-  SettingViewController 에서 두번쨰 환경설정 섹션에서 3개의 스위치가 각자작동해야하는데 전부 같은 구현을 하고있음.

