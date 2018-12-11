#  <#Title#>

project 에 target 이 여러건 있을때 cocoapod install 후 modulename-Swift.h(또는 projectname-Swift.h) 를 찾을수 없다는 에러가 난다. 
target 을 하나만 남기고 pod install 한 후 새 target 들을 복사해서 만들자.
아마도 기본 타켓에 대해서만 cocoapod 이 뭔가 설정하는 값이 있는듯.

