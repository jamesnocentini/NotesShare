# NotesShare

## Getting started

Install the Couchbase Lite dependency using Cocoapods:

```bash
pod install
```

## Running the app with SyncGateway

Download the SyncGateway binary from [here](http://www.couchbase.com/nosql-databases/downloads) and start it with notes-config.json:

```bash
$ ~/Downloads/sync_gateway/bin/sync_gateway notes-config.json
```

Create two users via the admin port of SyncGateway. On the simulator, the app will log in as James and on devices, it will log in as John.
```bash
curl -X PUT -H 'Content-Type: application/json' -d '{"name":"James", "password":"password"}' http://localhost:4985/notes_sharing/_user/James
curl -X PUT -H 'Content-Type: application/json' -d '{"name":"John", "password":"password"}' http://localhost:4985/notes_sharing/_user/John

curl -X PUT -H 'Content-Type: application/json' -d '{"type":"profile", "name":"James"}' http://localhost:4985/notes_sharing/James
curl -X PUT -H 'Content-Type: application/json' -d '{"type":"profile", "name":"John"}' http://localhost:4985/notes_sharing/John
```

Change the SyncGateway url in AppDelegate.swift to your instance of SyncGateway.
