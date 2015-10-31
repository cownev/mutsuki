## GET /api/v1/ping
Should equal json at path "header/message".

### Example

#### Request
```
GET /api/v1/ping HTTP/1.1
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
X-Request-Id: 06634b18-b9fb-4050-8cfe-ed7352a7807b
X-Runtime: 0.447152
X-UA-Compatible: chrome=1
X-XSS-Protection: 1; mode=block

{
  "header": {
    "status": 200,
    "message": "ok"
  }
}
```

## PUT /api/v1/service/user/create?app_id=:app_id&app_key=:app_key&os=:os
Should eq 3.

### Example

#### Request
```
PUT /api/v1/service/user/create?app_id=25&app_key=9651918567daeb4f&os=iOS HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Content-Length: 0
Content-Type: application/x-www-form-urlencoded
Host: www.example.com
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 69
Content-Type: application/json
ETag: "85d629d15e623f98aae3a0f29bce1196"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 3f3372e1-1fe8-4977-b6ae-af5bc431c557
X-Runtime: 0.057049
X-UA-Compatible: chrome=1
X-XSS-Protection: 1; mode=block

{
  "header": {
    "status": 200,
    "message": "ok"
  },
  "content": {
    "user": {
      "id": 91
    }
  }
}
```

## GET /api/v1/service/user?app_id=:app_id&app_key=:app_key&uid=:uid&efrom=:efrom
Should equal json at path "content/events/0/private_flg".

### Example

#### Request
```
GET /api/v1/service/user?app_id=25&app_key=9651918567daeb4f&uid=89&efrom=2013-01-01 HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Content-Length: 0
Content-Type: application/x-www-form-urlencoded
Host: www.example.com
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 165
Content-Type: application/json
ETag: "488eb0633cac6d9649aaf1ee308ca61d"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 87642a34-f73d-40a4-9afe-855fa831c214
X-Runtime: 0.119457
X-UA-Compatible: chrome=1
X-XSS-Protection: 1; mode=block

{
  "header": {
    "status": 200,
    "message": "ok"
  },
  "content": {
    "user": {
      "id": 89
    },
    "events": [
      {
        "id": 186,
        "name": "event-3",
        "date": "2013-01-01",
        "creator_user_id": 89,
        "private_flg": 1
      }
    ]
  }
}
```

## DELETE /api/v1/service/user/delete?app_id=:app_id&app_key=:app_key&uid=:uid
Should not be present.

### Example

#### Request
```
DELETE /api/v1/service/user/delete?app_id=25&app_key=9651918567daeb4f&uid=89 HTTP/1.1
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
X-Request-Id: f1d49d06-8511-4fea-b406-7e2761023b5e
X-Runtime: 0.010391
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
Should eq 7.

### Example

#### Request
```
PUT /api/v1/service/user/event/create?app_id=25&app_key=9651918567daeb4f&uid=89&name=test-event&date=2000-01-01&private_flg=0 HTTP/1.1
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
X-Request-Id: d463dd34-75a4-4323-b7b8-7cf1e71e5471
X-Runtime: 0.011627
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
Should be present.

### Example

#### Request
```
PUT /api/v1/service/user/event/update?app_id=25&app_key=9651918567daeb4f&uid=89&eid=185&name=test-event&date=2000-01-01&private_flg=0 HTTP/1.1
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
X-Request-Id: 8a23b06a-8627-4e08-a6a1-1c8faf1a28ad
X-Runtime: 0.026255
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
Should not be present.

### Example

#### Request
```
DELETE /api/v1/service/user/event/remove?app_id=25&app_key=9651918567daeb4f&uid=89&eid=185 HTTP/1.1
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
X-Request-Id: 8da52111-f847-4c38-bb0e-42b7c9df7384
X-Runtime: 0.005648
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
Should be present.

### Example

#### Request
```
PUT /api/v1/service/user/event/add?app_id=25&app_key=9651918567daeb4f&uid=89&eid=188 HTTP/1.1
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
X-Request-Id: d928e3f8-a178-4f32-9872-5006ce9f60ea
X-Runtime: 0.008382
X-UA-Compatible: chrome=1
X-XSS-Protection: 1; mode=block

{
  "header": {
    "status": 200,
    "message": "ok"
  }
}
```
