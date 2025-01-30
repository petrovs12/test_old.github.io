---
id: are7nmluevzuh6fug63bft2
title: "Major point:"
desc: ""
updated: 2024-12-15T22:35
created: 1643107901387
---
 For-my-own purposes summary from [Apigee's OAuth Pamphlet](https://cloud.google.com/files/apigee/apigee-oauth-the-big-picture-ebook.pdf).

OAuth allows an app to use the API of a platform (say Twitter) on your behalf without ever seeing your Twitter password.

# Businesses as Platforms

Markets have intermediaries, who connect buyers and sellers by knowing what both want and create convenient ways to transact.
Apps are the new intermediaries.

# API's are way for machines to talk to each other

API's require trust. Innovation require openness. Trust and openness are at odds.

An innovative app could want to use your Twitter/Facebook/Google/etc data for a specific purpose.
It uses that by calling some API's Twitter/Facebook/Google provide.

But, you can't trust the app with your google password, as you have everything in there. If the password leaks, you're boned

OAuth is a way to get around this. 

# Vallet Key

A vallet key for a car is a **limited privilige key** you can use to operate the car, but not access the car's glove box or trunc.

 OAuth tries to simulate this by having it's own **vallet key: token** giving a single app/API access to particular API's/services on a **service provider (e.g. Twitter)** on behalf of the user .

 ![](/assets/images/2022-01-25-12-06-54.png)

# Flow: Miko, stefApp, and Twitter

1. Miko uses stefApp on phone, which uses Twitter API for something.Miko already has logins for
   stefApp and twitter.
2. Behind the scenes, stefApp starts the process of getting access from Twitter.
3. A browser opens, asking Miko to log into with twitter.
4. A page apprears, asking if Miko gives permission to stefApp to do specific things 
   and not do other things w/ Miko's Twitter account.
5. If Miko agrees, then a token is sent back and stored on Miko's phone.

This can be sharded to make it harder for a thief to get access to your Twitter account.
stefApp never sees Miko's password.

Key/token permissions cna be gracefully upgraded/downgraded/ stopped if needed.

