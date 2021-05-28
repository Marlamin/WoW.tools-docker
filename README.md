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

Build data, build processing and getting the various site processes to work together is still very WIP/incomplete. Next few steps will be dicey:

- Compile [BuildBackup](https://github.com/Marlamin/BuildBackup) (rework branch) and put it in the tools/buildbackup folder.
- Attach a shell to the site image (e.g. `docker exec -it wowtools-docker_site_1 bash` with the correct image name for your site image).
- `cd /home/wow/buildbackup` to browse to where the BuildBackup tool you copied earlier is mounted.
- `dotnet BuildBackup.dll partialdl` to run BuildBackup in partial download mode to skip downloading many GBs of archives (for now)
- After that is down, `cd /var/www/wow.tools/builds/scripts` and run `php process.php buildconfig && php process.php cdnconfig && php process.php patchconfig` to seed the database with config data.  
- Builds will show up on the Builds page, albeit without linked cdnconfig. Stop here for now.
- **TODO for repo:** Mapping CDNconfigs to buildconfigs uses monitor data on the real WoW.tools site, there is no monitor data available in the docker image so it cannot link CDNconfigs to buildconfigs.  
- **TODO for repo:** Run through the rest of `/var/www/wow.tools/builds/scripts/update.sh` until all needed things work.
