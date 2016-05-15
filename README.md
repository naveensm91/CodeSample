 In addition to file syncing and sharing, [Box](https://www.box.com) allows users to create comments about a file. 

# Instructions

1) Fork this repository

2) Signup for a Box developer account

3) Create an app only user in your Box account (keep note of the user ID, you'll need it):
    
    curl https://api.box.com/2.0/users -H "Authorization: Bearer ACCESS_TOKEN" -d '{"name": SOME_NAME, "is_platform_access_only": true}' -X post

4) Write your code and tests to go with it

5) Make sure all tests are passing
