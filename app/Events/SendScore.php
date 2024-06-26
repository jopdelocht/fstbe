<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;
use Mockery\Undefined;

class SendScore implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public function __construct(
        public int $userid,
        public int $score,
        public string $gamecode
    ) {
    }

    public function broadcastOn(): array
    {
        return [$this->gamecode];
    }

    public function broadcastAs(): string
    {
        return 'score';
    }
}
