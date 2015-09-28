## PUT /api/v1/service/user/create?app_id=:app_id&app_key=:app_key&os=:os
Should have json type "integer" at path "content/user/id".

### Example

#### Request
```
PUT /api/v1/service/user/create?app_id=1&app_key=22382dfae383ab3a&os=iOS HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Content-Length: 0
Content-Type: application/x-www-form-urlencoded
Host: www.example.com
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 68
Content-Type: application/json
ETag: "89580b3e56beef1edc76d40036ac8629"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 3132d7b7-10de-4865-9ab8-b129ffa0e796
X-Runtime: 0.430511
X-UA-Compatible: chrome=1
X-XSS-Protection: 1; mode=block

{
  "header": {
    "status": 200,
    "message": "ok"
  },
  "content": {
    "user": {
      "id": 3
    }
  }
}
```

## GET /api/v1/service/user?app_id=:app_id&app_key=:app_key&uid=:uid
Should equal json at path "header/message".

### Example

#### Request
```
GET /api/v1/service/user?app_id=1&app_key=22382dfae383ab3a&uid=1 HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Content-Length: 0
Content-Type: application/x-www-form-urlencoded
Host: www.example.com
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 325
Content-Type: application/json
ETag: "ddd53840a2391e60c62b2f899cbf503f"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 38a84f93-c34a-46ab-8b0c-a1c5a1f4e0f0
X-Runtime: 0.090259
X-UA-Compatible: chrome=1
X-XSS-Protection: 1; mode=block

{
  "header": {
    "status": 200,
    "message": "ok"
  },
  "content": {
    "user": {
      "id": 1
    },
    "events": [
      {
        "id": 1,
        "name": "event-1",
        "date": "2015-01-01",
        "creator_user_id": 1,
        "private_flg": 1
      },
      {
        "id": 2,
        "name": "event-2",
        "date": "2015-01-01",
        "creator_user_id": 1,
        "private_flg": 1
      },
      {
        "id": 3,
        "name": "event-3",
        "date": "2015-01-01",
        "creator_user_id": 1,
        "private_flg": 1
      }
    ]
  }
}
```

## DELETE /api/v1/service/user/delete?app_id=:app_id&app_key=:app_key&uid=:uid
Should equal json at path "header/message".

### Example

#### Request
```
DELETE /api/v1/service/user/delete?app_id=1&app_key=22382dfae383ab3a&uid=1 HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Content-Length: 0
Content-Type: application/x-www-form-urlencoded
Host: www.example.com
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 40
Content-Type: application/json
ETag: "40edb044fc7973b91d6ccaf6efd6037e"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: d2773ce0-5fe0-4f5f-a2ca-d095648de27d
X-Runtime: 0.038746
X-UA-Compatible: chrome=1
X-XSS-Protection: 1; mode=block

{
  "header": {
    "status": 200,
    "message": "ok"
  }
}
```

## PUT /api/v1/service/user/event/create?app_id=:app_id&app_key=:app_key&uid=:uid&name=:name&date=:date&private_flg=:private_flg
Should equal json at path "header/message".

### Example

#### Request
```
PUT /api/v1/service/user/event/create?app_id=1&app_key=22382dfae383ab3a&uid=1&name=test-event&date=2000-01-01&private_flg=1 HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Content-Length: 0
Content-Type: application/x-www-form-urlencoded
Host: www.example.com
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 40
Content-Type: application/json
ETag: "40edb044fc7973b91d6ccaf6efd6037e"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: dec6fc82-75e6-4a6b-81c2-60d72054c8dc
X-Runtime: 0.012968
X-UA-Compatible: chrome=1
X-XSS-Protection: 1; mode=block

{
  "header": {
    "status": 200,
    "message": "ok"
  }
}
```

## PUT /api/v1/service/user/event/update?app_id=:app_id&app_key=:app_key&uid=:uid&eid=:eid&name=:name&date=:date&private_flg=:private_flg
Should equal json at path "header/message".

### Example

#### Request
```
PUT /api/v1/service/user/event/update?app_id=1&app_key=22382dfae383ab3a&uid=1&eid=2&name=test-event&date=2000-01-01&private_flg=1 HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Content-Length: 0
Content-Type: application/x-www-form-urlencoded
Host: www.example.com
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 40
Content-Type: application/json
ETag: "40edb044fc7973b91d6ccaf6efd6037e"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 71196821-0a39-43bc-aa2f-2e7fbd05ffdc
X-Runtime: 0.026533
X-UA-Compatible: chrome=1
X-XSS-Protection: 1; mode=block

{
  "header": {
    "status": 200,
    "message": "ok"
  }
}
```

## DELETE /api/v1/service/user/event/remove?app_id=:app_id&app_key=:app_key&uid=:uid&eid=:eid
Should equal json at path "header/message".

### Example

#### Request
```
DELETE /api/v1/service/user/event/remove?app_id=1&app_key=22382dfae383ab3a&uid=1&eid=2 HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Content-Length: 0
Content-Type: application/x-www-form-urlencoded
Host: www.example.com
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 40
Content-Type: application/json
ETag: "40edb044fc7973b91d6ccaf6efd6037e"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: fb996aee-64e3-410d-a19b-34aea93c2811
X-Runtime: 0.006857
X-UA-Compatible: chrome=1
X-XSS-Protection: 1; mode=block

{
  "header": {
    "status": 200,
    "message": "ok"
  }
}
```

## PUT /api/v1/service/user/event/add?app_id=:app_id&app_key=:app_key&uid=:uid&eid=:eid
Should equal json at path "header/message".

### Example

#### Request
```
PUT /api/v1/service/user/event/add?app_id=1&app_key=22382dfae383ab3a&uid=1&eid=5 HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Content-Length: 0
Content-Type: application/x-www-form-urlencoded
Host: www.example.com
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 40
Content-Type: application/json
ETag: "40edb044fc7973b91d6ccaf6efd6037e"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: d6ca83b1-7adf-45d6-8386-6a43e38d8f56
X-Runtime: 0.013418
X-UA-Compatible: chrome=1
X-XSS-Protection: 1; mode=block

{
  "header": {
    "status": 200,
    "message": "ok"
  }
}
```
