const functions = require("firebase-functions");

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

// // Start writing Firebase Functions
// // https://firebase.google.com/docs/functions/typescript
//
const app = require('express')();
//const { getAllScreams, postOneScream, getScream, commentOnScream, likeScream, unlikeScream, deleteScream} = require('./handlers/screams');
//const { signup, login, uploadImage, addUserDetails, getAuthenticatedUser} = require('./handlers/users');
const { db } = require('./util/admin');

// Users Routes
// app.post('/login' , login);
// app.post('/signup', signup);
// app.post('/user/image', FBAuth, uploadImage);
// app.post('/user', FBAuth, addUserDetails);
// app.get('/user', FBAuth, getAuthenticatedUser);

//  Scream Routes
 app.get('/users', (request, response) => {
                         db.collection('users')
                             .get().then(data => {
                             let users = [];
                             data.forEach(doc => {
                                 users.push({
                                     id : doc.id,
                                     name : doc.data().name,
                                     email : doc.data().email,
                                     imageUrl : doc.data().imageUrl
                                 });
                             });
                             response.json(users);
                         })
                             .catch( (error) => console.error(error));
                     });


// app.post('/scream', FBAuth, postOneScream);
// app.get('/scream/:screamId',  getScream);
// app.delete('/scream/:screamId', FBAuth, deleteScream);
// app.get('/scream/:screamId/like', FBAuth, likeScream);
// app.get('/scream/:screamId/unlike', FBAuth, unlikeScream);
// app.post('/scream/:screamId/comment', FBAuth, commentOnScream);

exports.api = functions.region('europe-west1').https.onRequest(app);
// exports.createNotificationOnLike = functions.region('europe-west1').firestore.document(`/likes/{id}`)
//     .onCreate(snapshot => {
//         db.doc(`/screams/${snapshot.data().screamId}`).get()
//             .then((doc) => {
//                 if(doc.exists){
//                     return db.doc(`/notifications/${snapshot.id}`).set({
//                         createdAt: new Date().toISOString(),
//                         recipient: doc.data().userHandle,
//                         sender: snapshot.data().userHandle,
//                         read: false,
//                         screamId: doc.id,
//                         type: 'like'
//
//                     })
//                         .then(() => {
//                             return;
//                         })
//                         .catch(err => {
//                             console.error(err);
//                             return;
//                         })
//                 }
//             })
//     });
// exports.createNotificationOnComment = functions.region('europe-west1').firestore.document(`/comments/{id}`)
//     .onCreate(snapshot => {
//         db.doc(`/screams/${snapshot.data().screamId}`).get()
//             .then((doc) => {
//                 if(doc.exists){
//                     return db.doc(`/notifications/${snapshot.id}`).set({
//                         createdAt: new Date().toISOString(),
//                         recipient: doc.data().userHandle,
//                         sender: snapshot.data().userHandle,
//                         read: false,
//                         screamId: doc.id,
//                         type: 'comment'
//
//                     })
//                         .then(() => {
//                             return;
//                         })
//                         .catch(err => {
//                             console.error(err);
//                             return;
//                         })
//                 }
//             })
//     });
// exports.createNotificationOnUnLike = functions.region('europe-west1').firestore.document(`/likes/{id}`)
// .onDelete( snapshot => {
//     db.doc(`/screams/${snapshot.data().screamId}`).get()
//         .then(doc => {
//             if(doc.exists){
//                 db.doc(`/notifications/${snapshot.id}`).delete()
//                     .then(() => {
//                         return;
//                     })
//                     .catch(err => {
//                         console.error(err);
//                         return;
//                     })
//
//             }
//         })
// });
