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

require_once(ROOT_DIR . 'Pages/SecurePage.php');
require_once(ROOT_DIR . 'Presenters/LandingPresenter.php');

class LandingPage extends SecurePage implements ILandingPage
{
    private $items = array();

	public function __construct()
	{
		parent::__construct('MyLanding');
		$this->_presenter = new LandingPresenter($this);
	}

	public function PageLoad()
	{
		$this->_presenter->Initialize();

        $this->Set('items', $this->items);
		$this->Display('landing.tpl');
    }
    
    public function AddItem(DashboardItem $item)
	{
		$this->items[] = $item;
	}
}

interface ILandingPage {
	function AddItem(DashboardItem $item);
}