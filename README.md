# WoW.tools Docker 
The intent of this repo is to (somewhat) easily get a local copy of WoW.tools running. 

## Set up
- Clone the repository with submodules (`git clone --recurse-submodules -j8 https://github.com/Marlamin/WoW.tools-docker`).
- After initial cloning is done, copy `www/inc/config.sample.php` to `www/inc/config.php` and `www/inc/db.sample.php` to `www/inc/db.php`.
- Rename the host in the connection string in `www/inc/config.php` from `localhost` to `mysql`.
- Set the values in `www/inc/db.php` to the following:
```
$db = 'casc';
$dbuser = 'root';
$dbpassword = 'wowtools';
```
- Build and run the images with `docker-compose up -d`.
- The site should now be available when browsing to `http://localhost`.

Build data, build processing and getting the various site processes to work together is still WIP/TODO.
