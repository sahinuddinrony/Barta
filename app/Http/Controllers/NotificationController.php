<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class NotificationController extends Controller
{
    public function showAllNotification()
    {

        $unreadNotifications = auth()->user()->unreadNotifications()->get();
        $notifications = auth()->user()->notifications()
            ->whereNotNull('read_at')
            ->orderBy('read_at','desc')->get();

        return view('barta.pages.notification', compact('unreadNotifications','notifications'));
    }

    public function markAllAsRead()
    {
        auth()->user()->unreadNotifications()->update(['read_at' => now()]);

        return to_route('notifications');
    }

    public function markAsRead($id)
    {
        $notification = auth()->user()->unreadNotifications()->find($id);

        //dd($notification);
        if ($notification) {
            $notification->update(['read_at' => now()]);
            // $notification->data['post_id'];
            return redirect()->route('view_post', ['postId' => $notification->data['post_id']]);
        }

        //return redirect()->route('posts.show', $notification['data']['post_id']);
    }
}
