# Portfolio

This is the source code for my personal homepage.

## Deploy the site content

```
firebase deploy --only hosting
```

## Deploy the backend API endpoints

### firebase functions

Some firebase functions are defined as part of the firebase project.

```
firebase deploy --only functions
```
## cloud functions

Additional cloud functions are mainted outside of the firebase project.

```
cd cloud-functions
./deploy.sh
```
