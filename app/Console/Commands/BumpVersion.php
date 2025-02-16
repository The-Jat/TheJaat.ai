<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

// php artisan app:bump-version major
// php artisan app:bump-version minor
// php artisan app:bump-version patch
// php artisan app:bump-version build

class BumpVersion extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:bump-version {type : The type of version to bump (major, minor, patch, build)}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Bump the application version (major, minor, patch, build)';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $type = $this->argument('type');

        $version = config('version');

        switch ($type) {
            case 'major':
                $version['major']++;
                $version['minor'] = 0;
                $version['patch'] = 0;
                $version['build'] = 0;
                break;

            case 'minor':
                $version['minor']++;
                $version['patch'] = 0;
                $version['build'] = 0;
                break;

            case 'patch':
                $version['patch']++;
                $version['build'] = 0;
                break;

            case 'build':
                $version['build']++;
                break;

            default:
                $this->error('Invalid version type. Please use major, minor, patch, or build.');
                return 1;
        }

        // Save the new version to the config/version.php file
        $versionContent = '<?php return ' . var_export($version, true) . ';' . PHP_EOL;
        file_put_contents(config_path('version.php'), $versionContent);

        $this->info("Version bumped to {$version['major']}.{$version['minor']}.{$version['patch']}+{$version['build']}");

        return 0;
    }
}
