### Setting up

#### 1. Fork the repo

#### 2. Clone the repo using your fork

    $ git clone git://github.com/<your git username>/bayanihand.git

#### 3. Do a bundle install

	$ bundle install

Please use Ruby 1.9.2.

#### 4. Edit config/database.yml to reflect your database

#### 5. Setup your database

	$ rake db:create
	$ rake db:test:prepare

#### 6. Check if all tests are passing

	$ bundle exec cucumber

### Start coding!
---

### Contributing

#### 1. Clone the repo using the steps above

#### 2. Create a feature branch

    $ cd my_apps/bayanihan
	$ git checkout -b new_feature

Be descriptive in the feature name and use underscores. Also, don't make it too long as it will make it harder for you to push in the long run.

#### 3. Create tests, do your changes, pass tests, commit.

Please use atomic commits and make the commit messages short but descriptive. "Fixed bug" is not a very descriptive commit message but "Fixed <insert bug description here> bug" is okay(You don't have to tell how you fixed it, just what the bug was).

#### 4. Push your changes to your feature branch.

    $ git push origin new_feature

#### 5. Create a pull request

Go to https://github.com/crigor/bayaninhand/ and click "Pull request" in the upper right. Add some comments and press "Send pull request".
