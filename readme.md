login credentials:

user:
cymon
cymon

merchant:
merchant
merchant



angular

Remove-Item -Recurse -Force node\_modules -ErrorAction SilentlyContinue

Remove-Item -Force package-lock.json -ErrorAction SilentlyContinue

npm cache clean --force

npm install --legacy-peer-deps --force

npm uninstall @angular/http --force

npm install @angular/common@8.0.3 --force

npm install @angular/forms@8.0.3 --force

npm install @angular/platform-browser@8.0.3 --force

npm install @angular/platform-browser-dynamic@8.0.3 --force

npm install @angular/router@8.0.3 --force

npm install --save-dev @angular-devkit/build-angular@0.803.29 --force

npm install querystring --save

npm install url --save

npm start

