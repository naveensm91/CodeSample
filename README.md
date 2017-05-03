 In addition to file syncing and sharing, [Box](https://www.box.com) allows users to create comments about a file. 

# Instructions

1) Signup for a Box developer account

2) Create an app only user in your Box account (keep note of the user ID):
    
    curl https://api.box.com/2.0/users -H "Authorization: Bearer ACCESS_TOKEN" -d '{"name": SOME_NAME, "is_platform_access_only": true}' -X post
