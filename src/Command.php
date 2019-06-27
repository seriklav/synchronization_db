<?php
/**
 * Developers by Lavrinyuk Sergey on 6/27/19 11:58 AM.
 * Last modified 6/27/19 11:58 AM.
 * Copyright (c) 2019. All rights reserved.
 */
namespace Console;

use MySQLImport;
use Symfony\Component\Console\Command\Command as SymfonyCommand;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

class Command extends SymfonyCommand
{
	public function __construct()
	{
		parent::__construct();
	}
	protected function start(InputInterface $input, OutputInterface $output, $option)
	{
		$output->writeln([
			'====**** lavrinyuk.serik@gmail.com ****====',
			'====**** SevenPowerX.com.ua ****====',
			'==== SYNCHRONIZATION DB ====',
			'==========================================',
		]);

		$type = $input->getArgument('type');

		$output->writeln([
			'',
			'::::TYPE(' . $type . ') START METHOD ' . ($type == 1 ? 'LOCAL => SERVER' : 'SERVER => LOCAL') . '::::',
		]);


		if ((int)$type == 1) {
			// local to server
			$type_option_dump = [];
			$type_option_import = [];

			$type_option_dump = array_merge($type_option_dump, $option['local']);
			$type_option_dump['path'] = $option['path']['local'];

			$type_option_import = array_merge($type_option_import, $option['remote']);
			$type_option_import['path'] = $option['path']['local'];

		} else {
			// server to local
			$type_option_dump = [];
			$type_option_import = [];

			$type_option_dump = array_merge($type_option_dump, $option['remote']);
			$type_option_dump['path'] = $option['path']['remote'];

			$type_option_import = array_merge($type_option_import, $option['local']);
			$type_option_import['path'] = $option['path']['remote'];
		}

		$this->localDump($output, $type_option_dump);
		$this->importDump($output, $type_option_import);
	}

	// SYNC FROM LOCAL TO REMOTE
	private function localDump($output, $option) {
		$output->writeln([
			'',
			'====create local dump====',
		]);

		try {
			$time = -microtime(true);

			$dump = new \MySQLDump(new \mysqli($option['host'], $option['user'], $option['pass'], $option['dbname']));

			$dump->save($option['path']);

			$time += microtime(true);

			$output->writeln([
				'====dump created ' . $time . 's===',
			]);

		} catch (\Exception $e) {
			$output->writeln([
				'====mysqldump-php error: ' . $e->getMessage() . '====',
			]);
		}
	}
	private function importDump($output, $option) {
		try {
			$output->writeln([
				'',
				'====import dump to server====',
			]);

			$time = -microtime(true);

			$import = new MySQLImport(new \mysqli($option['host'], $option['user'], $option['pass'], $option['dbname']));

			$import->onProgress = function ($count, $percent) {
				if ($percent !== null) {
					echo (int) $percent . " %\r";
				} elseif ($count % 10 === 0) {
					echo '.';
				}
			};

			$import->load($option['path']);

			$time += microtime(true);

			$output->writeln([
				'====dump uploaded to server ' . $time . 's====',
			]);
		} catch (\Exception $e) {
			$output->writeln([
				'====mysqldump-php error: ' . $e->getMessage() . '====',
				'',
			]);
		}
	}
}