<?php
/**
 * Developers by Lavrinyuk Sergey on 6/27/19 11:58 AM.
 * Last modified 6/27/19 11:58 AM.
 * Copyright (c) 2019. All rights reserved.
 */
namespace Console;

use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;
use Console\Command;

class TimeCommand extends Command
{
	private $options = [];

	/**
	 * TimeCommand constructor.
	 * @param $options
	 */
	public function __construct($options)
	{
		$this->options = $options;
		parent::__construct();
	}

	public function configure()
	{
		$this->setName('start')
			->setDescription('This command synchronization all DB from remote host')
			->addArgument('type', InputArgument::OPTIONAL, 'The type of the sync 1 - local=>server(DEFAULT); 2 - server=>local.', '1');
	}

	public function execute(InputInterface $input, OutputInterface $output)
	{
		$this->start($input, $output, $this->options);
	}
}