#How to Install MySQL on Mac OS X Mavericks

  * Since you're on a Mac, you can use homebrew: `$ brew install mysql`
  * You will see output like this:

  		To connect:
		mysql -uroot

		To have launchd start mysql at login:
			ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents

		Then to load mysql now:
			launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist

		Or, if you don't want/need launchctl, you can just run:
			mysql.server start
		==> /usr/local/Cellar/mysql/5.6.17_1/bin/mysql_install_db --verbose --user=Home --basedir=/usr/local/Cellar/mysql/5.6.17_1 --datadir=/usr/local/var/mysql --tmpdir=/tmp
		==> Summary
		🍺  /usr/local/Cellar/mysql/5.6.17_1: 9510 files, 338M


  * Download the .dmg (x86-64)
  * Run the installer like any Mac app
  * A README.txt is included in the .dmg - you should read this one even if you 	don't understand it.
  * Use the alias bash commands
    * OR add '/usr/local/mysql/bin/mysql' to your 'PATH' environment

    * NOTE: If you check out the forums, posts are old. If you are looking for Ruby 	related posts, you will probably be hesitant to trust the information in the 	forums.

  * Install the pref pane.
  * Start server from pref pane - button.
  * Test a database connection:

	    $ mysql -u root test
	    mysql> CREATE DATABASE;

  * View your users' priveleges:

	    SELECT Host,
	    User,
	    Password,
	    Select_priv,
	    Update_priv,
	    Delete_priv,
	    Create_priv,
	    Drop_priv,
	    password_expired
	    FROM mysql.user;

    * Notice only root users.

    * And blank users - these are anonymous users.


    GRANT all priveleges
    ON sharetribe_developmnet.*
    TO 'sharetribe'@'localhost'
    IDENTIFIED BY 'password'

  * The mysql.db table holds access privelegs for your TEST db or any db that has a name beginning with "TEST_". View your TEST db users' access priveleges:

		select
		Host,
		Db,
		User,
		Select_priv,
		Insert_priv,
		Update_priv,
		Delete_priv,
		Create_priv,
		Drop_priv,
		Grant_priv
		from mysql.db;

 * You should set a password for your root users, otherwise anyone can log in with root on those hosts, which will give them all priveleges on your database.

		$ mysql -u root
		mysql> SET PASSWORD FOR 'root'@'localhost' = PASSWORD('newpwd');
		mysql> SET PASSWORD FOR 'root'@'127.0.0.1' = PASSWORD('newpwd');
		mysql> SET PASSWORD FOR 'root'@'::1' = PASSWORD('newpwd');
		mysql> SET PASSWORD FOR 'root'@'%' = PASSWORD('newpwd');

 * You should also set passwords for your anonymous users:

		$ mysql -u root -p
		Enter password: (enter root password here)
		mysql> SET PASSWORD FOR ''@'localhost' = PASSWORD('newpwd');
		mysql> SET PASSWORD FOR ''@'host_name' = PASSWORD('newpwd');
