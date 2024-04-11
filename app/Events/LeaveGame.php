<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;


class LeaveGame implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    // determine which user to be deleted
    public function __construct(
        public int $userid,
        public string $gamecode
    ) {
    }

    // determine which channel to broadcast on
    public function broadcastOn(): array
    {
        return [$this->gamecode];
    }

    // determine which event to broadcast as
    public function broadcastAs(): string
    {
        return 'leftgame';
    }
}
