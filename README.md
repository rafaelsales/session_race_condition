Session race condition
======================

A minimal project to test a session race condition

Notes
-----
To create a scenario where the race condition occurs, it is necessary to run deploy this project in a server that support at least two instances simultanously so that it can handle at least two requests in parallel. The Rails built-in server only support one instance, while Apache + Passenger can be configured to run multiple instances.

Steps to recreate the race condition
------------------------------------
1. Start the web server

2. In your browser, go to http://localhost:3000/session_race_condition/index

3. Then go to http://localhost:3000/session_race_condition/change_session_lazy

4. Before the previous request is completed, i.e. in less than 10 seconds after the it was made, open another browser tab and go to http://localhost:3000/session_race_condition/change_session_fast

5. After the last two requests are completed, go to http://localhost:3000/session_race_condition/index and verify the session contains attribute :creation and either attribute :one or :two.


The reason why it happens is because whenever an action makes a change to the session and finish, it replace the current Rails session state with the session state before the action had begun plus the changes the action had made, hence ignoring the changes made by other actions that began, changed the session and finished after the first had started.

Future work: create a functional test to make these steps using ForkBreak gem.
