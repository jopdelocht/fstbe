<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class SetScoreToTask implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public function __construct(
        public int $taskid,
        public int $averagescore,
        public int $lowestscore,
        public int $highestscore,
        public string $gamecode
    ) {
    }

    public function broadcastOn(): array
    {
        return [$this->gamecode];
    }

    public function broadcastAs(): string
    {
        return 'setscoretotask';
    }
}
