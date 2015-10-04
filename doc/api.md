## PUT /api/v1/service/user/create?app_id=:app_id&app_key=:app_key&os=:os
Should eq 3.

### Example

#### Request
```
PUT /api/v1/service/user/create?app_id=1&app_key=0d893920ec0f1af7&os=iOS HTTP/1.1
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
ETag: "2ee3481772f0095acfc7c072f9b9c0ce"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: dcdc5aeb-2bf9-4c1b-98fd-24cf806ac297
X-Runtime: 0.007236
X-UA-Compatible: chrome=1
X-XSS-Protection: 1; mode=block

{
  "header": {
    "status": 200,
    "message": "ok"
  },
  "content": {
    "user": {
      "id": 4
    }
  }
}
```

## GET /api/v1/service/user?app_id=:app_id&app_key=:app_key&uid=:uid&efrom=:efrom
Should equal json at path "content/events/0/private_flg".

### Example

#### Request
```
GET /api/v1/service/user?app_id=1&app_key=0d893920ec0f1af7&uid=1&efrom=2013-01-01 HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Content-Length: 0
Content-Type: application/x-www-form-urlencoded
Host: www.example.com
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 161
Content-Type: application/json
ETag: "9383c8a9d74b99a0448ce8a74e6d0322"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: c25310f1-6c64-4855-ab3c-e9939eec567d
X-Runtime: 0.114438
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
        "id": 3,
        "name": "event-3",
        "date": "2013-01-01",
        "creator_user_id": 1,
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
DELETE /api/v1/service/user/delete?app_id=1&app_key=0d893920ec0f1af7&uid=1 HTTP/1.1
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
X-Request-Id: 32f846bc-bf39-453d-afa4-92fa49bd538f
X-Runtime: 0.037645
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
PUT /api/v1/service/user/event/create?app_id=1&app_key=0d893920ec0f1af7&uid=1&name=test-event&date=2000-01-01&private_flg=0 HTTP/1.1
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
X-Request-Id: 00a2607f-7209-421e-8f34-f4e14e4d3aec
X-Runtime: 0.011034
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
PUT /api/v1/service/user/event/update?app_id=1&app_key=0d893920ec0f1af7&uid=1&eid=2&name=test-event&date=2000-01-01&private_flg=0 HTTP/1.1
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
X-Request-Id: df4ed9ac-971e-437d-89ec-0b2473041fd6
X-Runtime: 0.061644
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
DELETE /api/v1/service/user/event/remove?app_id=1&app_key=0d893920ec0f1af7&uid=1&eid=2 HTTP/1.1
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
X-Request-Id: 75948ef4-183c-4435-8dc7-1fff72516981
X-Runtime: 0.006379
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
PUT /api/v1/service/user/event/add?app_id=1&app_key=0d893920ec0f1af7&uid=1&eid=5 HTTP/1.1
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
X-Request-Id: b4c60906-a8b5-47d8-a23b-05407ebac86e
X-Runtime: 0.009228
X-UA-Compatible: chrome=1
X-XSS-Protection: 1; mode=block

{
  "header": {
    "status": 200,
    "message": "ok"
  }
}
```
