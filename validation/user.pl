{
    fields => [qw{name email user_type_id}],
    checks => [
        [qw{name email user_type_id}] => is_required('Field required!'),

        name => is_long_at_most( 24, 'name is too long' ),
        email => is_long_at_most( 1024, 'email is too long' ),
        email => sub { check_email($_[0], "Please enter a valid e-mail address.") },
    ],
}
