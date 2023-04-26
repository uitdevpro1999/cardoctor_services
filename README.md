
The Car Services SDK is a Flutter package for Epass Car Services

## Getting started

Environment:
sdk: '>=2.12.0 <3.0.0'

Import package into pubspec.yaml

```
dependencies:
  cardoctor_services: ^0.0.6
```

## Usage
Usage:
- SDK has 2 types of Flavor : PRODUCTION & STAGING
```dart
//add function
String? EncryptionData;
String contractId;
String name;
String phone;
String identifier;
Future<void> openSDK(BuildContext context) async{
  final sdk = SdkCarServices(SdkFlavor.PRODUCTION,EncryptionData,contractId,name,phone,identifier);
  await sdk.open(context);
}
// in your button's code,add function
openSDK(context);
```

## Additional information

