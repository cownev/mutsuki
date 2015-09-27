## PUT /api/v1/service/user/create?app_id=:id&app_key=:key&os=:os
Should have json type "integer" at path "content/user/id".

### Example

#### Request
```
PUT /api/v1/service/user/create?app_id=1&app_key=1fbc530560324c90&os=iOS HTTP/1.1
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
ETag: "b0a181a778084052cce4aa54716bd440"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: f03826cb-a9db-4608-8f26-9e58c0f93e53
X-Runtime: 0.386749
X-UA-Compatible: chrome=1
X-XSS-Protection: 1; mode=block

{
  "header": {
    "status": 200,
    "message": "OK"
  },
  "content": {
    "user": {
      "id": 3
    }
  }
}
```

## GET /api/v1/service/user?app_id=:id&app_key=:key&uid=:uid
Should equal json at path "header/message".

### Example

#### Request
```
GET /api/v1/service/user?app_id=1&app_key=1fbc530560324c90&uid=1 HTTP/1.1
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
ETag: "13c278ced066199b8105c3faf6470e16"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: e3ec111a-8764-4963-ae92-2afad6c4b177
X-Runtime: 0.097175
X-UA-Compatible: chrome=1
X-XSS-Protection: 1; mode=block

{
  "header": {
    "status": 200,
    "message": "OK"
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

## DELETE /api/v1/service/user/delete?app_id=:id&app_key=:key&uid=:uid
Should equal json at path "header/message".

### Example

#### Request
```
DELETE /api/v1/service/user/delete?app_id=1&app_key=1fbc530560324c90&uid=1 HTTP/1.1
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
ETag: "3e8015832620b04c91e0f979b80abedd"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: fcbcd77c-3a60-46a3-a66d-a52b9a140678
X-Runtime: 0.026883
X-UA-Compatible: chrome=1
X-XSS-Protection: 1; mode=block

{
  "header": {
    "status": 200,
    "message": "OK"
  }
}
```

## PUT /api/v1/service/user/event/create?app_id=:id&app_key=:key&uid=:uid&name=:name&date=:date&private_flg=:private_flg
Should equal json at path "header/message".

### Example

#### Request
```
PUT /api/v1/service/user/event/create?app_id=1&app_key=1fbc530560324c90&uid=1&name=test-event&date=2000-01-01&private_flg=1 HTTP/1.1
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
ETag: "3e8015832620b04c91e0f979b80abedd"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 2e385445-db01-42c8-b249-66a16dd49bb3
X-Runtime: 0.047622
X-UA-Compatible: chrome=1
X-XSS-Protection: 1; mode=block

{
  "header": {
    "status": 200,
    "message": "OK"
  }
}
```

## PUT /api/v1/service/user/event/update?app_id=:id&app_key=:key&uid=:uid&eid=:eid&name=:name&date=:date&private_flg=:private_flg
Should equal json at path "header/message".

### Example

#### Request
```
PUT /api/v1/service/user/event/update?app_id=1&app_key=1fbc530560324c90&uid=1&eid=2&name=test-event&date=2000-01-01&private_flg=1 HTTP/1.1
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
ETag: "3e8015832620b04c91e0f979b80abedd"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: bc496af7-4097-472a-bbfe-e7a2411dee9c
X-Runtime: 0.069703
X-UA-Compatible: chrome=1
X-XSS-Protection: 1; mode=block

{
  "header": {
    "status": 200,
    "message": "OK"
  }
}
```

## DELETE /api/v1/service/user/event/remove?app_id=:id&app_key=:key&uid=:uid&eid=:eid
Should equal json at path "header/message".

### Example

#### Request
```
DELETE /api/v1/service/user/event/remove?app_id=1&app_key=1fbc530560324c90&uid=1&eid=2 HTTP/1.1
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
ETag: "3e8015832620b04c91e0f979b80abedd"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: d1916ff7-bb1c-4473-ad3a-1b0c6a1dfdf3
X-Runtime: 0.006370
X-UA-Compatible: chrome=1
X-XSS-Protection: 1; mode=block

{
  "header": {
    "status": 200,
    "message": "OK"
  }
}
```

## PUT /api/v1/service/user/event/add?app_id=:id&app_key=:key&uid=:uid&eid=:eid
Should equal json at path "header/message".

### Example

#### Request
```
PUT /api/v1/service/user/event/add?app_id=1&app_key=1fbc530560324c90&uid=1&eid=5 HTTP/1.1
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
ETag: "3e8015832620b04c91e0f979b80abedd"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 87720608-457b-46ef-87b9-ebd9ef419e28
X-Runtime: 0.009786
X-UA-Compatible: chrome=1
X-XSS-Protection: 1; mode=block

{
  "header": {
    "status": 200,
    "message": "OK"
  }
}
```
