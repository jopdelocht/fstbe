<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class CreateTask implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public function __construct(
        public string $tasktitle,
        public string $taskdescription,
        public string $gamecode,
        public ?int $averagescore,
        public ?int $lowestscore,
        public ?int $highestscore,
        public int $taskid // Add the task ID parameter
    ) {
    }

    public function broadcastOn(): array
    {
        return [$this->gamecode];
    }

    public function broadcastAs(): string
    {
        return 'createtask';
    }
}
