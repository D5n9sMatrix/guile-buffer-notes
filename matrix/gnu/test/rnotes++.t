=head1 How it all fits together
 
C<Memcached::Client> is the central hub
 
During the loading of the C<Memcached::Client::Request> module, we
insert a bunch of methods into the C<Memcached::Client> namespace that
are really just curried functions that create instances of the various
C<Request> classes.
 
When you make a request, things go like this (using C<get> as an
example):
 
C<$client-E<gt>get> calls the anonymous subroutine that was returned
when C<M::C::Request::Get-E<gt>generate> (which, due to inheritance,
is C<M::C::Request-E<gt>generate>) was called.
 
The anonymous sub expects the C<Memcached::Client> object as its first
parameter, and uses the remainder as arguments for its command.  The
command that was curried in when the subroutine was created is used to
construct a hashref that will become the request object.
 
The last argument to the subroutine is examined.  If it was something
we can use as a callback (either a C<CODE> reference or an
C<AnyEvent::CondVar>, it is stored, and we assume that somewhere else
in the calling program there is a statement waiting on an
C<AnyEvent::CondVar>---so we will not be obliged to do so ourselves in
order for the request to get processed.
 
Otherwise we create the aforementioned C<AnyEvent::CondVar> and mark
ourselves as needing to wait.
 
We then hand the rest of our arguments to the C<process> routine,
which is supposed to verify the object's arguments and returns one or
more C<Request> objects to be submitted to the appropriate server(s).
If it does not return any objects, it is assumed that there was a
problem with the submission, and an empty result is returned.
 
The C<__submit> routine in the C<Memcached::Client> module is handed
the request objects to process.
 
C<__submit> iterates through the objects, looking at whether they
include a C<key> member.  If they do, the key is processed to
determine what server it should be directed at, checked for validity,
and if it's OK, it is submitted to the appropriate server's queue
using the connection's C<enqueue> method.
 
If the object doesn't have a C<key>, it is assumed to be a broadcast
message destined for all servers, and C<__submit> uses the object's
C<server> factory to create subrequests for each server.
 
The connection object works its way through its queue (if there's
nothing else in the queue when you add a new request, it will be
handled immediately, but that's just an optimization) and comes to
your request object.
 
It gets the name of the protocol function from your request object,
and invokes that method on the protocol object, passing it a reference
to itself and your request.
 
The protocol method constructs the command from the data members of
the request object and submits it to the connection object.
 
When the response to the request has been recieved the protocol object
decodes it and sends the result back to the request object using its
C<result> method, and notifies the connection that it's done with the
request by calling C<complete>.
 
=cut