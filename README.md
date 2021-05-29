# WoW.tools Docker 
The intent of this repo is to (somewhat) easily get a local copy of WoW.tools running. 

## Local CDN
WoW.tools uses a local copy of Blizzard's CDN for most of its file storage for speed, stability and archival reasons. This means that a full local copy will be required for most basic features to work. A local CDN copy includes data for all locales, all branches and all patches going back quite a while. Significant storage space for this is required (**TODO Check how much**) and it will take quite a while to do the initial download. This will be stored in the "tpr" folder, shared between several of the Docker containers.

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

- Create a "work" folder inside the root folder of this repo. This will be where shared things go (tools, binaries, generated database definitions, etc).
- Compile [BuildBackup](https://github.com/Marlamin/BuildBackup) (rework branch) and put it in the work/buildbackup folder.
- Attach a shell to the site image (e.g. `docker exec -it wowtools-docker_site_1 bash` with the correct image name for your site image).
- `cd /home/wow/buildbackup` to browse to where the BuildBackup tool you copied earlier is mounted.
- Modify config.json and make cacheDir point to `/var/www/wow.tools/`
- `dotnet BuildBackup.dll partialdl` to run BuildBackup in partial download mode to skip downloading many GBs of archives.
- After that is done, `cd /var/www/wow.tools/builds/scripts` and run `php process.php buildconfig && php process.php cdnconfig && php process.php patchconfig` to seed the database with config data.  
- Builds will show up on the Builds page, albeit without linked cdnconfig. Stop here for now.
- Go back to the BuildBackup dir (`cd /home/wow/buildbackup`) and run `dotnet BuildBackup.dll` to do a full download of the CDN. This will take up a lot of space and a long time depending on download speed (see "Local CDN").
- **TODO for repo:** Mapping CDNconfigs to buildconfigs uses monitor data on the real WoW.tools site, there is no monitor data available in the docker image so it cannot link CDNconfigs to buildconfigs.  
- **TODO for repo:** Run through the rest of `/var/www/wow.tools/builds/scripts/update.sh` until all needed things work.
