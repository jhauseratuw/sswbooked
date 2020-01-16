{*
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
*}
{include file='globalheader.tpl' Qtip=true}

<style>
	a, a:visited {
		color: inherit;
	}

	a, a:hover {
		color: inherit;
	}
</style>
<div id="page-dashboard2">
	<div id="dashboardList2">
		{if $smarty.get.type == 'room'}
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Unrestricted Room Reservations</h3>
				</div>
				<div class="panel-body">
					{foreach from=$Resources['unrestricted']['resources'] item=$Resource key=$i}
						{if $i % 2 == 0}
							<div class="row">							
						{/if}
						<div class="col-sm-6">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">
										<a href="schedule.php?sid={$Resource->GetScheduleId()}">{$Resource->GetName()}</a>
									</h3>
								</div>
								<div class="panel-body">
									<a href="schedule.php?sid={$Resource->GetScheduleId()}">
										{assign var='ImageSrc' value="{Configuration::Instance()->GetScriptUrl()}/{Configuration::Instance()->GetKey(ConfigKeys::IMAGE_UPLOAD_URL)}/{$Resource->GetImage()}"}
										<img src="{$ImageSrc}" alt="{$Resource->GetName()}">
									</a>
									<p>{$Resource->GetDescription()|nl2br}</p>
								</div>
							</div>
						</div>
						{if $i % 2 != 0}
							</div>							
						{/if}
					{/foreach}
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Restricted Room Reservations</h3>
				</div>
				<div class="panel-body">
					{foreach from=$Resources['restricted']['resources'] item=$Resource key=$i}
						{if $i % 2 == 0}
							<div class="row">							
						{/if}
						<div class="col-sm-6">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">
										<a href="schedule.php?sid={$Resource->GetScheduleId()}">{$Resource->GetName()}</a>
									</h3>
								</div>
								<div class="panel-body">
									<a href="schedule.php?sid={$Resource->GetScheduleId()}">
										{assign var='ImageSrc' value="{Configuration::Instance()->GetScriptUrl()}/{Configuration::Instance()->GetKey(ConfigKeys::IMAGE_UPLOAD_URL)}/{$Resource->GetImage()}"}
										<img src="{$ImageSrc}" alt="{$Resource->GetName()}">
									</a>
									<p>{$Resource->GetDescription()|nl2br}</p>
								</div>
							</div>
						</div>
						{if $i % 2 != 0}
							</div>							
						{/if}
					{/foreach}
				</div>
			</div>
		{else}
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Equipment</h3>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-sm-4">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">
										<a href="schedule.php?sid=2">Laptops</a>
									</h3>
								</div>
								<div class="panel-body">
									<a href="schedule.php?sid=2"><img src="uploads/images/ZZ_laptops.jpg" alt="Photo of Mac and PC Laptop" class="img-responsive"></a>
								</div>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">
										<a href="schedule.php?sid=3">Projectors</a>
									</h3>
								</div>
								<div class="panel-body">
									<a href="schedule.php?sid=3"><img src="uploads/images/ZZ_Projector.jpg" alt="Photo of Projector" class="img-responsive"></a>
								</div>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">
										<a href="schedule.php?sid=5">Video Cameras</a>
									</h3>
								</div>
								<div class="panel-body">
									<a href="schedule.php?sid=5"><img src="uploads/images/ZZ_VideoCamera.jpg" alt="Photo of Video Camera" class="img-responsive"></a>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-4">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">
										<a href="schedule.php?sid=6">Still Cameras</a>
									</h3>
								</div>
								<div class="panel-body">
									<a href="schedule.php?sid=6"><img src="uploads/images/ZZ_StillCamera.jpg" alt="Photo of Still Camera" class="img-responsive"></a>
								</div>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">
										<a href="schedule.php?sid=4">Slide/Overhead Projector or Screens</a>
									</h3>
								</div>
								<div class="panel-body">
									<a href="schedule.php?sid=4"><img src="uploads/images/ZZ_SlideOverhead.jpg" alt="Photo of Slide/Overhead Projector and Screen" class="img-responsive"></a>
								</div>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">
										<a href="schedule.php?sid=12">Laser Clickers / Accessories</a>
									</h3>
								</div>
								<div class="panel-body">
									<a href="schedule.php?sid=12"><img src="uploads/images/ZZ_Accessories.jpg" alt="Photo of Accessories" class="img-responsive"></a>
								</div>
							</div>
						</div>
					</div>			
				</div>
			</div>
		{/if}
	</div>
</div>

{include file='globalfooter.tpl'}