<?php
/**
Copyright 2011-2017 Nick Korbel

This file is part of Booked Scheduler.

Booked Scheduler is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Booked Scheduler is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Booked Scheduler.  If not, see <http://www.gnu.org/licenses/>.
*/

require_once(ROOT_DIR . 'lib/Config/namespace.php');
require_once(ROOT_DIR . 'lib/Common/namespace.php');
require_once(ROOT_DIR . 'lib/Database/namespace.php');
require_once(ROOT_DIR . 'lib/Database/Commands/namespace.php');
require_once(ROOT_DIR . 'Domain/Access/namespace.php');

class LandingPresenter
{
	private $_page;
	
	public function __construct(ILandingPage $page)
	{
		$this->_page = $page;
		$this->resourceRepository = new ResourceRepository();
		$this->scheduleRepository = new ScheduleRepository();
	}
	
	public function Initialize()
	{
		$resources = $this->resourceRepository->GetResourceList();

		$schedule_id_map = [
			7 => 'unrestricted',
			8 => 'restricted',
			9 => 'restricted',
			10 => 'restricted',
			11 => 'restricted',
			17 => 'restricted',
			2 => 'equipment',
			3 => 'equipment',
			4 => 'equipment',
			5 => 'equipment',
			6 => 'equipment',
			12 => 'equipment',
		];
		
		$resources_by_type = [
			'unrestricted' => [
				'resources' => []
			],
			'restricted' => [
				'resources' => []
			]
		];
		foreach ($resources as $resource) {
			$schedule_id = $resource->GetScheduleId();
			$key = $schedule_id_map[$schedule_id];
			if ($key != 'equipment') {
				$resources_by_type[$key]['resources'][] = $resource;
			}
		}

		$this->_page->Set('Resources', $resources_by_type);
	}
}