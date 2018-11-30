#  What is app signing?

## Code Signing
- https://help.apple.com/xcode/mac/current/#/dev3a05256b8 

- App 이 signed 되었고, 그 이후로 변경되지 않았음을 system 에 보증함 
- iOS 는 valid 한 signature 를 가진 앱만 실행시킴
- app executable bundle 이 변경되면 signature 는 invalid 되므로, 위변조된 앱은 실행될수 없음 
 


## Signing certificate 
- xcode build process 에서 앱을 signing 
- public-private key pair + certificate 
- private key : cryptographic function to generate the signature 
- certificate : issued by apple ==> contains the public key and identifies you as the owner of the key pair 
- certificate  는 키체인에 보관됨 

- 개발용 인증서 (Development certificates) : allowed per Mac, developer site 에 개발 인증서 보면, 맥이름으로 되어있음  
- 배포용 인증서 (Distribution certificates) :  belong to the team and are limited. App Store and Ad Hoc distribution certificates
    - Team agent or Admin role 만 생성가능
    - To share with another person on your team : export the signing certificate and install on other person's Mac 
    - 여러 팀에 속해있거나, 맥을 여러대 쓸때 인증서를 내가 직접 관리하려면, Xcode account preference 나  Keychain access 에서 create and revoke 할수 있다. 

- Apple re-signs all apps sold on the App Store 
An app’s signature can be removed, and the app can be re-signed using another signing certificate. For example, Apple re-signs all apps sold on the App Store. Also, a fully-tested development build of your app can be re-signed for submission to the App Store. Thus the signature is best understood not as proof of the app’s origin but as a verifiable mark placed by the signer.


