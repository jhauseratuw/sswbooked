<?php
/**
 * Copyright 2017-2018 Nick Korbel
 *
 * This file is part of Booked Scheduler.
 *
 * Booked Scheduler is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Booked Scheduler is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Booked Scheduler.  If not, see <http://www.gnu.org/licenses/>.
 */

require_once(ROOT_DIR . 'Controls/Dashboard/ResourceAvailabilityControl.php');

class ResourceAvailabilityControlPresenter
{
    /**
     * @var IResourceAvailabilityControl
     */
    private $control;

    /**
     * @var IResourceService
     */
    private $resourceService;

    /**
     * @var IReservationViewRepository
     */
    private $reservationViewRepository;
    /**
     * @var IScheduleRepository
     */
    private $scheduleRepository;

    public function __construct(IResourceAvailabilityControl $control,
                                IResourceService $resourceService,
                                IReservationViewRepository $reservationViewRepository,
                                IScheduleRepository $scheduleRepository)
    {
        $this->control = $control;
        $this->resourceService = $resourceService;
        $this->reservationViewRepository = $reservationViewRepository;
        $this->scheduleRepository = $scheduleRepository;
        $this->resourceRepository = new ResourceRepository();
    }

    public function PageLoad(UserSession $user)
    {
        $schedules = $this->scheduleRepository->GetAll();
        $room_ids = [7, 8, 9, 10, 11, 17];
        $equipment_ids = [2, 3, 4, 5, 6, 12];

        $schedules_by_type = [
            [
                'name' => 'Rooms', 'schedules' => []
            ],
            [
                'name' => 'Restricted Rooms', 'schedules' => []
            ],
            [
                'name' => 'Equipment', 'schedules' => []
            ],
        ];
        foreach ($schedules as $schedule) {
            $schedule_id = $schedule->GetId();
            if ($schedule_id == 7) {
                $key = 0;
                $resources = $this->resourceRepository->GetScheduleResources($schedule_id);
                foreach($resources as $resource) {
                    $schedules_by_type[$key]['schedules'][] = $resource;
                }
            } else {
                $key = in_array($schedule_id, $room_ids) ? 1 : 2;
                $schedules_by_type[$key]['schedules'][] = $schedule;
            }
        }

        $this->control->SetSchedules($schedules_by_type);
    }

    /**
     * @param ResourceDto $resource
     * @param ReservationItemView[][] $reservations
     * @return ReservationItemView|null
     */
    private function GetOngoingReservation($resource, $reservations)
    {
        if (array_key_exists($resource->GetId(), $reservations) && $reservations[$resource->GetId()][0]->StartDate->LessThan(Date::Now())) {
            return $reservations[$resource->GetId()][0];
        }

        return null;
    }

    /**
     * @param ReservationItemView[] $reservations
     * @return ReservationItemView[][]
     */
    private function GetReservations($reservations)
    {
        $indexed = array();
        foreach ($reservations as $reservation) {
            $indexed[$reservation->ResourceId][] = $reservation;
        }

        return $indexed;
    }

    /**
     * @param ResourceDto $resource
     * @param ReservationItemView[][] $reservations
     * @return null|ReservationItemView
     */
    private function GetLastReservationBeforeAnOpening($resource, $reservations)
    {
        $resourceId = $resource->GetId();
        if (!array_key_exists($resourceId, $reservations)) {
            return null;
        }

        $resourceReservations = $reservations[$resourceId];
        for ($i = 0; $i < count($resourceReservations) - 1; $i++) {
            $current = $resourceReservations[$i];
            $next = $resourceReservations[$i + 1];

            if ($current->EndDate->Equals($next->StartDate)) {
                continue;
            }

            return $current;
        }

        return $resourceReservations[count($resourceReservations) - 1];
    }
}
