@foreach ( $unreadNotifications as  $unreadNotification )

<ul>
    <li>{{ $unreadNotification->data['message'] }}</li>
</ul>

@endforeach
