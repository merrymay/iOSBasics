# Distribution 

## Distribution Type
### Xcode 에서 직접 연결해서 설치 
### Enterprise
### Testflight 
- tester 가 모두 apple account 있어야 
### Adhoc 
- udid 모두 수집해야. 특히 udid 추가할때마다 프로비저닝 새로 만들어서 앱 새로 빌드해야 함 
- ref. https://github.com/kyungkoo/study-note/blob/master/iOS/ota-github.md 

### Adhoc 배포 방법
- 필요한 파일 
1. ipa : adhoc 으로 archive 
2. plist  : https 지원되는 서버에 올려야함 ==> (git pages 이용)
3. html 

- 배포 과정  
1. appID 등록, 해당 appid 에 대한 adhoc provisioning profile 생성, 다운로드
2. adhoc 으로 archive 
- 메타 파일 만들기 옵션 체크
- 위에서 받은 provisioning 사용 
3. git pages 생성 
4. archive output 에서 ipa, plist 를 git pages 에 업로드 
5. git pages 에 plist, html 편집 
6. device 브라우저에서 html url 로드  

### plist file 
- ipa url 확인 : https://merrymay.github.io/may.github.io/iOSBasics.ipa 
- bundle id 확인 : com.may.iOSBasics 
- icon image url 은 404나면 안되니 차라리 blank 로 두어야함

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
<key>items</key>
<array>
<dict>
<key>assets</key>
<array>
<dict>
<key>kind</key>
<string>software-package</string>
<key>url</key>
<string>https://merrymay.github.io/may.github.io/iOSBasics.ipa</string>
</dict>
<dict>
<key>kind</key>
<string>display-image</string>
<key>url</key>
<string></string>
</dict>
<dict>
<key>kind</key>
<string>full-size-image</string>
<key>url</key>
<string></string>
</dict>
</array>
<key>metadata</key>
<dict>
<key>bundle-identifier</key>
<string>com.may.iOSBasics</string>
<key>bundle-version</key>
<string>1.0</string>
<key>kind</key>
<string>software</string>
<key>title</key>
<string>iOSBasics</string>
</dict>
</dict>
</array>
</dict>
</plist>


### html file 
- plist url 은 gitpages 의 plist 의 raw file url 임!! 

<html>
<body>
<h1>Hello</h1>
<br/>
<a href="itms-services://?action=download-manifest&url=https://raw.githubusercontent.com/merrymay/may.github.io/master/manifest.plist">Download App</a>
</body>
</html>



