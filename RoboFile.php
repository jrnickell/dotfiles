<?php

use Robo\Tasks;
use Symfony\Component\Filesystem\Filesystem;
use Symfony\Component\Finder\Finder;

/**
 * RoboFile is the task runner for this project
 *
 * @copyright Copyright (c) 2015, John Nickell.
 * @license   http://opensource.org/licenses/MIT The MIT License
 * @author    John Nickell <https://johnnickell.com>
 */
class RoboFile extends Tasks
{
    /**
     * Application paths
     *
     * Access with getPaths()
     *
     * @var array
     */
    private $paths;

    /**
     * Filesystem
     *
     * Access with getFilesystem()
     *
     * @var Filesystem
     */
    private $filesystem;

    //===================================================//
    // Main Targets                                      //
    //===================================================//

    /**
     * Syncs home directory
     *
     * @param array $opts The options
     *
     * @option $force Override existing files
     */
    public function sync(array $opts = ['force' => false])
    {
        $force = isset($opts['force']) && $opts['force'] ? true : false;
        $this->stopOnFail(true);
        $this->yell('sync');
        if (!$force) {
            if (!$this->confirm('This will overwrite files in your home directory. Are you sure?')) {
                $this->info('sync cancelled');

                return;
            }
        }
        $this->info('starting sync');
        $this->clearBackup();
        $this->updateLinks();
        $this->updateCopies();
        $this->runScripts();
        $this->updateSublime();
        $this->info('sync complete');
    }

    //===================================================//
    // Clear Targets                                     //
    //===================================================//

    /**
     * Clears the previous backup
     */
    public function clearBackup()
    {
        $fs = $this->getFilesystem();
        $paths = $this->getPaths();
        $this->stopOnFail(true);
        $this->yell('clear:backup');
        $this->info('removing backup directory');
        $fs->remove($paths['backup']);
        $this->info('backup directory removed');
    }

    //===================================================//
    // Sub-commands                                      //
    //===================================================//

    /**
     * Updates symlinks
     */
    private function updateLinks()
    {
        $fs = $this->getFilesystem();
        $paths = $this->getPaths();
        foreach ($this->findLinkPaths() as $link) {
            $dotname = sprintf('.%s', $link->getBasename());
            $origin = $link->getRealpath();
            $destination = sprintf('%s/%s', $paths['home'], $dotname);
            $backup = sprintf('%s/%s', $paths['backup'], $dotname);
            if ($fs->exists($destination)) {
                $this->copy($destination, $backup);
                $this->say(sprintf('backup %s created', $backup));
                $fs->remove($destination);
                $fs->symlink($origin, $destination);
                $this->say(sprintf('%s linked to %s', $origin, $destination));
            } else {
                $fs->symlink($origin, $destination);
                $this->say(sprintf('%s linked to %s', $origin, $destination));
            }
        }
    }

    /**
     * Updates copies
     */
    private function updateCopies()
    {
        $fs = $this->getFilesystem();
        $paths = $this->getPaths();
        foreach ($this->findCopyPaths() as $copy) {
            $dotname = sprintf('.%s', $copy->getBasename());
            $origin = $copy->getRealpath();
            $destination = sprintf('%s/%s', $paths['home'], $dotname);
            $backup = sprintf('%s/%s', $paths['backup'], $dotname);
            if ($fs->exists($destination)) {
                $this->copy($destination, $backup);
                $this->say(sprintf('backup %s created', $backup));
                $fs->remove($destination);
                $this->copy($origin, $destination);
                $this->say(sprintf('%s copied to %s', $origin, $destination));
            } else {
                $this->copy($origin, $destination);
                $this->say(sprintf('%s copied to %s', $origin, $destination));
            }
        }
    }

    /**
     * Runs scripts
     */
    private function runScripts()
    {
        foreach ($this->findScripts() as $script) {
            $path = $script->getRealpath();
            $this->taskExec('bash')
                ->arg($path)
                ->printed(true)
                ->run();
        }
    }

    /**
     * Updates settings for Sublime Text
     */
    private function updateSublime()
    {
        $fs = $this->getFilesystem();
        $paths = $this->getPaths();
        $basePath = $paths['home'].'/.config/sublime-text-3/Packages/User';
        foreach ($this->findSublime() as $sublime) {
            $origin = $sublime->getRealpath();
            $destination = sprintf('%s/%s', $basePath, $sublime->getBasename());
            $backup = sprintf('%s/sublime/%s', $paths['backup'], $sublime->getBasename());
            if ($fs->exists($destination)) {
                $this->copy($destination, $backup);
                $this->say(sprintf('backup %s created', $backup));
                $fs->remove($destination);
                $this->copy($origin, $destination);
                $this->say(sprintf('%s copied to %s', $origin, $destination));
            } else {
                $this->copy($origin, $destination);
                $this->say(sprintf('%s copied to %s', $origin, $destination));
            }
        }
    }

    //===================================================//
    // Finder Methods                                    //
    //===================================================//

    /**
     * Retrieves copy paths
     *
     * @return Traversable
     */
    private function findCopyPaths()
    {
        $paths = $this->getPaths();
        $iterator = Finder::create()
            ->depth(0)
            ->in($paths['copy']);

        return $iterator;
    }

    /**
     * Retrieves link paths
     *
     * @return Traversable
     */
    private function findLinkPaths()
    {
        $paths = $this->getPaths();
        $iterator = Finder::create()
            ->depth(0)
            ->in($paths['link']);

        return $iterator;
    }

    /**
     * Retrieves script paths
     *
     * @return Traversable
     */
    private function findScripts()
    {
        $paths = $this->getPaths();
        $iterator = Finder::create()
            ->files()
            ->name('*.sh')
            ->in($paths['script'])
            ->sortByName();

        return $iterator;
    }

    /**
     * Retrieves paths for sublime text
     *
     * @return Traversable
     */
    private function findSublime()
    {
        $paths = $this->getPaths();
        $iterator = Finder::create()
            ->depth(0)
            ->in($paths['sublime']);

        return $iterator;
    }

    //===================================================//
    // Helper Methods                                    //
    //===================================================//

    /**
     * Prints text with info color
     *
     * @param string $message The message
     */
    private function info($message)
    {
        $this->say(sprintf('<fg=blue>%s</fg=blue>', $message));
    }

    /**
     * Retrieves application paths
     *
     * @return array
     */
    private function getPaths()
    {
        if ($this->paths === null) {
            $this->paths = require __DIR__.'/paths.php';
        }

        return $this->paths;
    }

    /**
     * Retrieves filesystem helper
     *
     * @return Filesystem
     */
    private function getFilesystem()
    {
        if ($this->filesystem === null) {
            $this->filesystem = new Filesystem();
        }

        return $this->filesystem;
    }

    /**
     * Copies a file or directory
     *
     * @param  string $origin      The origin path
     * @param  string $destination The destination path
     */
    private function copy($origin, $destination)
    {
        $fs = $this->getFilesystem();
        if (is_dir($origin)) {
            $fs->mirror($origin, $destination, null, true);
        } else {
            $fs->copy($origin, $destination, true);
        }
    }
}
