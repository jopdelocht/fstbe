<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class JoinGame implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    // user object creation in pusher array
    public function __construct(
        public int $userid,
        public string $username,
        public string $gamecode,
        public string $role,
        public ?int $score
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
        return 'joinedgame';
    }
}
