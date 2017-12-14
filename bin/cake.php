#!/usr/bin/php -q
<?php
// Check platform requirements
require dirname(__DIR__) . '/config/helloworld/requirements.php';
require dirname(__DIR__) . '/vendor/autoload.php';

use App\Application;
use Cake\Console\CommandRunner;

// Build the runner with an application and root executable name.
$runner = new CommandRunner(new Application(dirname(__DIR__) . '/config/helloworld'), 'cake');
exit($runner->run($argv));
