{*
Copyright 2017-2018 Nick Korbel

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
*}

<div class="dashboard dashboard availabilityDashboard" id="availabilityDashboard">
	<div class="dashboardHeader">
		<div class="pull-left">Schedules</div>
		<div class="pull-right">
			<a href="#" title="{translate key=ShowHide} {translate key="ResourceAvailability"}">
				<i class="glyphicon"></i>
			</a>
		</div>
		<div class="clearfix"></div>
	</div>
	<div class="dashboardContents">
		{foreach from=$Schedules item=s}
			<h5>{$s['name']}</h5>
			{foreach from=$s['schedules'] item=i}
				<div class="availabilityItem">
					<div class="col-xs-12 col-sm-5">
						<div class="resourceName">
							{if $s['name'] == 'Rooms'}
								<a href="{$Path}{Pages::SCHEDULE}?{QueryStringKeys::SCHEDULE_ID}={$i->GetScheduleId()}">{$i->GetName()}</a>
							{else}
								<a href="{$Path}{Pages::SCHEDULE}?{QueryStringKeys::SCHEDULE_ID}={$i->GetId()}">{$i->GetName()}</a>
							{/if}
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			{/foreach}
		{/foreach}
	</div>
</div>