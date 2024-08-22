Renovate submodule update extraction problem with `persistRepoData: true`
-------------------------------------------------------------------------

Run `./run.sh` once:

```json
 "packageFiles": {
   "git-submodules": [
     {
       "deps": [
         {
           "depName": "renovate",
           "packageName": "https://github.com/renovatebot/renovate.git",
           "currentValue": "main",
           "currentDigest": "1f65d316018d9b4db083f8d70b1817f976c3be8b",
           "updates": [
             {
               "updateType": "digest",
               "newValue": "main",
               "newDigest": "94d6067e4a8f22ed3e0e1b4affe1595061eece94",
               "branchName": "renovate/renovate-digest"
             }
           ],
           "versioning": "git",
           "warnings": []
         }
       ],
       "datasource": "git-refs",
       "packageFile": ".gitmodules"
     }
   ]
 }
```

Run `./run.sh` again:

```json
 "packageFiles": {
   "git-submodules": [
     {
       "deps": [
         {
           "depName": "renovate",
           "packageName": "https://github.com/renovatebot/renovate.git",
           "currentValue": "main",
           "currentDigest": "94d6067e4a8f22ed3e0e1b4affe1595061eece94",
           "updates": [],
           "versioning": "git",
           "warnings": []
         }
       ],
       "datasource": "git-refs",
       "packageFile": ".gitmodules"
     }
   ]
 }
```

2nd time the update not detected, and `currentDigest` is wrong.

Repository in `basedir/repos/github/amezin/renovate-submodule-fail` is modified, and Renovate doesn't discard local submodule changes:

```
$ cd basedir/repos/github/amezin/renovate-submodule-fail
$ git status
On branch main
Your branch is up to date with 'origin/main'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   renovate (new commits)

no changes added to commit (use "git add" and/or "git commit -a")
$ git submodule status renovate
+94d6067e4a8f22ed3e0e1b4affe1595061eece94 renovate (v8.48.1-18042-g94d6067e4)
```
