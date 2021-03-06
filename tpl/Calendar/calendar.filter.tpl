{*
Copyright 2011-2018 Nick Korbel

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
<div class="row form-inline">
    <div id="filter">

		{if $GroupName}
		<span class="groupName">{$GroupName}</span>
		{else}
		<div>
            <div class="inline">{indicator id=loadingIndicator}</div>
			<label for="calendarFilter">{translate key="ChangeCalendar"}</label>
			<select id="calendarFilter">
				{foreach from=$filters->GetFilters() item=filter}
					{foreach from=$filter->GetFilters() item=subfilter}
						<option value="r{$subfilter->Id()}" data-schedule-id="s{$filter->Id()}" class="resource" {if $subfilter->Selected()}selected="selected"{/if}>{$subfilter->Name()}</option>
					{/foreach}
				{/foreach}
			</select>
			<a href="#" id="showResourceGroups">{translate key=ResourceGroups}</a>
		</div>
		{/if}
	</div>

	<div id="resourceGroupsContainer">
		<div id="resourceGroups"></div>
	</div>
</div>

<script type="text/javascript">
	$(function(){
		$('#calendarFilter').select2();
	});

</script>